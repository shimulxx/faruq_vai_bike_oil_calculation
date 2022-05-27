import 'package:faruq_vai_bike/api/model.dart';
import 'package:faruq_vai_bike/api/use_cases.dart';
import 'package:faruq_vai_bike/controller/main_screen/main_screen_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenCubitState>{
  final CreateUpdateUseCase createUpdateUseCase;
  final ReadUseCase readUseCase;
  final DeleteUseCase deleteUseCase;
  final GetAllUseCase getAllUseCase;

  MainScreenCubit({
    required this.deleteUseCase,
    required this.readUseCase,
    required this.createUpdateUseCase,
    required this.getAllUseCase
  }) : super(const MainScreenCubitState());

  void loadCurrentList(){
    emit(state.copyWith(isLoading: true));
    final curList = getAllUseCase.getAll();
    emit(state.copyWith(isLoading: false, list: curList));
  }

  void createUpdate(BikeOilEntry entry){
    emit(state.copyWith(isLoading: true));
    final curList = createUpdateUseCase.createUpdate(bikeOilEntry: entry);
    emit(state.copyWith(isLoading: false, list: curList));
  }

}