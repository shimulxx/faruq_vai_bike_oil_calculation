import 'package:faruq_vai_bike/api/model.dart';
import '../objectbox.g.dart';

abstract class Repository{
  List<BikeOilEntry> createUpdate({required BikeOilEntry bikeOilEntry});
  BikeOilEntry? readById({required int id});
  List<BikeOilEntry> deleteById({required int id});
  List<BikeOilEntry> getAll();
}

class RepositoryImp implements Repository{
  final Box<BikeOilEntry> entries;

  RepositoryImp({required this.entries});

  List<BikeOilEntry> getUpdatedList() => entries.query().build().find();

  @override
  List<BikeOilEntry> createUpdate({required BikeOilEntry bikeOilEntry}) {
    //create has id 0 where update has valid id
    entries.put(bikeOilEntry);
    return getUpdatedList();
  }

  @override
  BikeOilEntry? readById({required int id}) {
    return entries.get(id);
  }

  @override
  List<BikeOilEntry> deleteById({required int id}) {
    entries.remove(id);
    return getUpdatedList();
  }

  @override
  List<BikeOilEntry> getAll() {
    return getUpdatedList();
  }
}
