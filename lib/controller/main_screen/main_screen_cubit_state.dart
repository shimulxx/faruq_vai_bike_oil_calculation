import 'package:equatable/equatable.dart';
import 'package:faruq_vai_bike/api/model.dart';

class MainScreenCubitState extends Equatable{
  final bool isLoading;
  final List<BikeOilEntry> list;
  final String message;
  final String resultMessage;

  const MainScreenCubitState({
    this.isLoading = true,
    this.list = const [],
    this.message = '',
    this.resultMessage = ''
  });

  MainScreenCubitState copyWith({
    bool? isLoading,
    List<BikeOilEntry>? list,
    String? message,
    String? resultMessage
  }){
    return MainScreenCubitState(
      isLoading: isLoading ?? this.isLoading,
      list: list ?? this.list,
      message: message ?? this.message,
      resultMessage: resultMessage ?? this.resultMessage
    );
  }

  @override
  List<Object?> get props => [isLoading, list, message, resultMessage];

}