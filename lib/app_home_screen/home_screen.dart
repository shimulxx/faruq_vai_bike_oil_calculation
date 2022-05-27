import 'package:faruq_vai_bike/app_alert_dialog/for_delete/for_delete_dialog.dart';
import 'package:flutter/material.dart';
import '../app_alert_dialog/add_edit/app_alert_dialog.dart';
import '../controller/main_screen/main_screen_cubit.dart';
import 'inner_widgets/bike_app_bar.dart';
import 'inner_widgets/heading_widget/heading_widget.dart';
import 'inner_widgets/main_body_widget/main_body_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainScreenCubit>();
    return Scaffold(
      appBar: BikeAppBar(
        onPressAdd: () async{
          final mp = await addEditAlertDialog(
            context: context,
            id: 0,
            initialLitreValue: '',
            initialMeterValue: ''
          );
          cubit.createUpdate(mp);
        },
        onPressClear: () async{
          final value = await deleteAlertDialog(context: context);
          if(value != null){ cubit.deleteAll(); }
          else { cubit.showCancelOperation(); }
        },
      ),
      body: Column(
        children: const [
          HeadingWidget(),
          MainBodyWidget(),
        ],
      ),
    );
  }
}
