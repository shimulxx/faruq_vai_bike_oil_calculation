import 'package:faruq_vai_bike/app_alert_dialog/add_edit/app_alert_dialog.dart';
import 'package:faruq_vai_bike/app_alert_dialog/for_delete/for_delete_dialog.dart';
import 'package:faruq_vai_bike/controller/main_screen/main_screen_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../app_constants/app_colors.dart';
import '../../../controller/main_screen/main_screen_cubit.dart';
import 'inner_widget/list_inner_widgets.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<MainScreenCubit, MainScreenCubitState>(
        listener: (context, state) async{
          if(state.message.isNotEmpty){
            EasyLoading.showToast(state.message);
          }
        },
        builder: (context, state) {
          if(state.isLoading){
            return const Center(child: CircularProgressIndicator(color: kAppBarColor,));
          }
          else{
            final curList = state.list;
            final cubit = context.read<MainScreenCubit>();
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final curItem = curList[index];
                    return ListInnerItem(
                      kmPerLitre: cubit.getCalculationByIndex(index),
                      date: curItem.date,
                      kilometers: curItem.meter,
                      litres: curItem.litre,
                      onPressEdit: () async{
                        final result = await addEditAlertDialog(
                          context: context,
                          id: curItem.id,
                          initialMeterValue: curItem.meter,
                          initialLitreValue: curItem.litre,
                        );
                        if(result != null) { cubit.createUpdate(result); }
                        else { cubit.showCancelOperation(); }
                      },
                      onPressDelete: () async{
                        final result = await deleteAlertDialog(context: context, id: curItem.id);
                        if(result != null) { cubit.deleteById(result['id']); }
                        else { cubit.showCancelOperation(); }
                      },
                      // onPressView: () {
                      //   cubit.showCalculationByIndex(index);
                      // },
                    );
                  },
                    childCount: curList.length,
                  ),
                ),
              ],
            );
          }
        },
      )
    );
  }
}