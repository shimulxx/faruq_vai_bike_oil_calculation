import 'package:faruq_vai_bike/api/model.dart';
import 'package:faruq_vai_bike/api/use_cases.dart';
import 'package:faruq_vai_bike/app_date_time/date_time_format.dart';
import 'package:faruq_vai_bike/controller/main_screen/main_screen_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenCubitState>{
  final CreateUpdateUseCase createUpdateUseCase;
  final ReadUseCase readUseCase;
  final DeleteUseCase deleteUseCase;
  final GetAllUseCase getAllUseCase;
  final RemoveAllUseCase removeAllUseCase;
  final AppDateTimeFormatUseCase appDateTimeFormatUseCase;

  final operationCancel = 'Operation canceled';
  final meterEmpty = 'Meter field is empty!';
  final litreEmpty = 'Litre field is empty!';
  final invalidMeter = 'Invalid meter input!';
  final invalidLitre = 'Invalid litre input!';
  final operationSuccess = 'Operation Successful!';
  final singleItemError = 'Last Item, Calculation is not possible';

  MainScreenCubit({
    required this.deleteUseCase,
    required this.readUseCase,
    required this.createUpdateUseCase,
    required this.getAllUseCase,
    required this.appDateTimeFormatUseCase,
    required this.removeAllUseCase,
  }) : super(const MainScreenCubitState());

  void loadCurrentList(){
    emit(state.copyWith(isLoading: true));
    final curList = getAllUseCase.getAll();
    emit(state.copyWith(isLoading: false, list: curList));
  }

  void _emitResultMessage(String resultMessage){
    emit(state.copyWith(resultMessage: resultMessage));
    emit(state.copyWith(resultMessage: ''));
  }

  void showCalculationByIndex(int index){
    final curList = state.list;
    if(index != curList.length - 1){
      try{
        final secondItem = curList[index + 1];
        final secondLitre = double.parse(secondItem.litre);
        if(secondLitre == 0.0) { throw UnsupportedError('Division by 0 occurs!'); }
        else{
          final firstItem = curList[index];
          final firstMeter = double.parse(firstItem.meter);
          final secondMeter = double.parse(secondItem.meter);
          final distance = firstMeter - secondMeter;
          final result = (distance / secondLitre).toStringAsFixed(2);
          final resultMessage = 'Bike oil usage: $result km/litre';
          _emitResultMessage(resultMessage);
        }
      }
      catch(e){
        final errorMessage = e.toString();
        _emitMessage(errorMessage);
      }

    }
    else{
      _emitMessage(singleItemError);
    }
  }

  void _emitMessage(String message){
    emit(state.copyWith(message: message));
    emit(state.copyWith(message: ''));
  }

  bool _validationOk(Map<String, dynamic> mp){
    if(mp['meter'].isEmpty) {
      _emitMessage(meterEmpty);
      return false;
    }
    else if(mp['litre'].isEmpty){
      _emitMessage(litreEmpty);
      return false;
    }
    else{
      try{ double.parse(mp['meter']); }
      catch(e){
        _emitMessage(invalidMeter);
        return false;
      }
      try{ double.parse(mp['litre']); }
      catch(e){
        _emitMessage(invalidLitre);
        return false;
      }
    }
    return true;
  }

  void showCancelOperation(){
    _emitMessage(operationCancel);
  }

  void _successfulListEmit(List<BikeOilEntry> curList){
    emit(state.copyWith(isLoading: false, list: curList));
    _emitMessage(operationSuccess);
  }

  void createUpdate(Map<String, dynamic>? mp){
    if(mp == null){ _emitMessage(operationCancel); }
    else{
      if(_validationOk(mp)){
        emit(state.copyWith(isLoading: true));
        final curList = createUpdateUseCase.createUpdate(
            bikeOilEntry: BikeOilEntry(
                date: mp['date'] ?? appDateTimeFormatUseCase.curTime(),
                meter: double.parse(mp['meter']).toString(),
                litre: double.parse(mp['litre']).toString(),
                id: mp['id']
            ));
        _successfulListEmit(curList);
      }
    }
  }

  void deleteById(int id){
    emit(state.copyWith(isLoading: true));
    final curList = deleteUseCase.deleteById(id: id);
    _successfulListEmit(curList);
  }

  void deleteAll(){
    emit(state.copyWith(isLoading: true));
    final curList = removeAllUseCase.removeAll();
    _successfulListEmit(curList);
  }

}