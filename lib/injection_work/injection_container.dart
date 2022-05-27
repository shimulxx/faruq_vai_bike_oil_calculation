import 'package:faruq_vai_bike/api/repository.dart';
import 'package:faruq_vai_bike/api/use_cases.dart';
import 'package:faruq_vai_bike/app_date_time/date_time_format.dart';
import 'package:faruq_vai_bike/app_router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import '../api/model.dart';
import '../controller/main_screen/main_screen_cubit.dart';
import '../objectbox.g.dart';

final GetIt di = GetIt.instance;

Future<void> registerAll() async{
  //cubit
  di.registerLazySingleton<MainScreenCubit>(() => MainScreenCubit(
    deleteUseCase: di(),
    createUpdateUseCase: di(),
    readUseCase: di(),
    getAllUseCase: di(),
    appDateTimeFormatUseCase: di(),
    removeAllUseCase: di(),
  ));

  //use cases & use cases implementation
  di.registerLazySingleton<CreateUpdateUseCase>(() => CreateUpdateUseCaseImp(repository: di()));
  di.registerLazySingleton<ReadUseCase>(() => ReadUseCaseImp(repository: di()));
  di.registerLazySingleton<DeleteUseCase>(() => DeleteUseCaseImp(repository: di()));
  di.registerLazySingleton<GetAllUseCase>(() => GetAllUseCaseImp(repository: di()));
  di.registerLazySingleton<RemoveAllUseCase>(() => RemoveAllUseCaseImp(repository: di()));

  //repository & repository implementation
  di.registerLazySingleton<Repository>(() => RepositoryImp(entries: di()));

  //database objects
  di.registerLazySingleton<Box<BikeOilEntry>>(() => di<Store>().box<BikeOilEntry>());
  di.registerSingletonAsync<Store>(() async => await openStore());

  //app router
  di.registerLazySingleton<AppRouter>(() => AppRouter());
  
  //app date use case
  di.registerLazySingleton<DateFormat>(() => DateFormat('yy-MM-dd hh:mm a'));
  di.registerLazySingleton<AppDateTimeFormatUseCase>(() => AppDateTimeFormatUseCaseImp(dateFormat: di()));

  //finalize async singleton
  await di.allReady();
}