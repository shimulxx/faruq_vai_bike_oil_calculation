import 'package:objectbox/objectbox.dart';

@Entity()
class BikeOilEntry {
  int id;
  String date;
  String meter;
  String litre;

  BikeOilEntry({
    this.id = 0,
    required this.date,
    required this.meter,
    required this.litre,
  });

  @override
  String toString() {
    return 'BikeOilEntry{id: $id, date: $date, meter: $meter, litre: $litre}';
  }
}
