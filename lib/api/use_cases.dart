import 'package:faruq_vai_bike/api/repository.dart';
import 'model.dart';

abstract class CreateUpdateUseCase{
  List<BikeOilEntry> createUpdate({required BikeOilEntry bikeOilEntry});
}

class CreateUpdateUseCaseImp implements CreateUpdateUseCase{
  final Repository repository;
  CreateUpdateUseCaseImp({required this.repository});

  @override
  List<BikeOilEntry> createUpdate({required BikeOilEntry bikeOilEntry}) {
      return repository.createUpdate(bikeOilEntry: bikeOilEntry);
  }
}

abstract class ReadUseCase{
  BikeOilEntry? readById({required int id});
}

class ReadUseCaseImp implements ReadUseCase{
  final Repository repository;
  ReadUseCaseImp({required this.repository});

  @override
  BikeOilEntry? readById({required int id}) {
    return repository.readById(id: id);
  }
}

abstract class DeleteUseCase{
  List<BikeOilEntry> deleteById({required int id});
}

class DeleteUseCaseImp implements DeleteUseCase{
  final Repository repository;
  DeleteUseCaseImp({required this.repository});

  @override
  List<BikeOilEntry> deleteById({required int id}) {
    return repository.deleteById(id: id);
  }
}

abstract class GetAllUseCase{
  List<BikeOilEntry> getAll();
}

class GetAllUseCaseImp implements GetAllUseCase{
  final Repository repository;
  GetAllUseCaseImp({required this.repository});

  @override
  List<BikeOilEntry> getAll() {
    return repository.getAll();
  }

}

abstract class RemoveAllUseCase{
  List<BikeOilEntry> removeAll();
}

class RemoveAllUseCaseImp implements RemoveAllUseCase{
  final Repository repository;
  RemoveAllUseCaseImp({required this.repository});

  @override
  List<BikeOilEntry> removeAll() {
    return repository.removeAll();
  }

}