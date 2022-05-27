import 'package:equatable/equatable.dart';
import 'package:faruq_vai_bike/api/model.dart';

class MainScreenCubitState extends Equatable{
  final bool isLoading;
  final List<BikeOilEntry> list;

  const MainScreenCubitState({
    this.isLoading = true,
    this.list = const [],
  });

  MainScreenCubitState copyWith({
    bool? isLoading,
    List<BikeOilEntry>? list,
  }){
    return MainScreenCubitState(
      isLoading: isLoading ?? this.isLoading,
      list: list ?? this.list
    );
  }

  @override
  List<Object?> get props => [isLoading, list];

}