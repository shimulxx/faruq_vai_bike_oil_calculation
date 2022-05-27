import 'package:faruq_vai_bike/controller/main_screen/main_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_home_screen/home_screen.dart';
import '../injection_work/injection_container.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings settings) {
    debugPrint(settings.name.toString());

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => di<MainScreenCubit>()..loadCurrentList(),
              child: const HomeScreen(),
            ),
        );
      default: return null;
    }
  }
}