import 'package:faruq_vai_bike/controller/main_screen/main_screen_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocBuilder<MainScreenCubit, MainScreenCubitState>(
        builder: (context, state) {
          if(state.isLoading){
            return const Center(child: CircularProgressIndicator(color: kAppBarColor,));
          }
          else{
            final curList = state.list;
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final curItem = curList[index];
                    return ListInnerItem(
                      date: curItem.date,
                      kilometers: curItem.meter,
                      litres: curItem.litre,
                      onPressEdit: () {
                        print('edit');
                      },
                      onPressDelete: () {
                        print('delete');
                      },
                      onPressView: () {
                        print('view');
                      },
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