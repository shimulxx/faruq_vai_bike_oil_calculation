import 'package:flutter/material.dart';
import 'bike_app_bar.dart';
import 'heading_widget.dart';
import 'main_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BikeAppBar(
          onPressAdd: (){
            print('add');
          },
          onPressClear: (){
            print('clear');
          },
        ),
        body: Column(
          children: const[
            HeadingWidget(),
            MainBodyWidget()
          ],
        )
    );
  }
}






