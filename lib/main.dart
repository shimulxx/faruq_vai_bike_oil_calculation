import 'package:faruq_vai_bike/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'injection_work/injection_container.dart' as injection_work;
import 'injection_work/injection_container.dart';

void easyLoadingUpdate(){
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..indicatorSize = 45.0
    ..radius = 5.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  easyLoadingUpdate();
  await injection_work.registerAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
     // home: const HomeScreen(),
      onGenerateRoute: di<AppRouter>().onGenerateRoute,
    );
  }
}