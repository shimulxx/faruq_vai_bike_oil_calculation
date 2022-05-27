import 'package:faruq_vai_bike/app_alert_dialog/for_delete/for_delete_dialog.dart';
import 'package:flutter/material.dart';
import '../api/model.dart';
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
            isAddOperation: true,
            initialLitreValue: '',
            initialMeterValue: ''
          );
          debugPrint(mp.toString());
          cubit.createUpdate(BikeOilEntry(date: '', meter: mp['meter'], litre: mp['litre']));
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