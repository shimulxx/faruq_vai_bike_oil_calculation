import 'package:faruq_vai_bike/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'injection_work/injection_container.dart' as injection_work;
import 'injection_work/injection_container.dart';

void main() async{
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
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
     // home: const HomeScreen(),
      onGenerateRoute: di<AppRouter>().onGenerateRoute,
    );
  }
}