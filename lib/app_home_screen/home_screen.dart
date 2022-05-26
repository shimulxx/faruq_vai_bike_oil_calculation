import 'package:faruq_vai_bike/app_alert_dialog/for_delete/for_delete_dialog.dart';
import 'package:flutter/material.dart';
import '../app_alert_dialog/add_edit/app_alert_dialog.dart';
import 'inner_widgets/bike_app_bar.dart';
import 'inner_widgets/heading_widget/heading_widget.dart';
import 'inner_widgets/main_body_widget/main_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BikeAppBar(
        onPressAdd: () async{
          final mp = await addEditAlertDialog(
            context: context,
            isAddOperation: true,
            initialLitreValue: '',
            initialMeterValue: ''
          );
          debugPrint(mp.toString());
        },
        onPressClear: () async{
          final value = await deleteAlertDialog(context: context);
          debugPrint(value.toString());
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
