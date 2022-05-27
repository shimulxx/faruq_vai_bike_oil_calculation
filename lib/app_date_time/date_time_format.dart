import 'package:intl/intl.dart';

abstract class AppDateTimeFormatUseCase{
  String curTime();
}

class AppDateTimeFormatUseCaseImp implements AppDateTimeFormatUseCase{
  final DateFormat dateFormat;

  AppDateTimeFormatUseCaseImp({required this.dateFormat});

  @override
  String curTime() {
    return dateFormat.format(DateTime.now());
  }

}