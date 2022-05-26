import 'package:flutter/material.dart';
import 'inner_widget/list_inner_widgets.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListInnerItem(
                date: '12/12/22',
                kilometers: '123',
                litres: 300.toString(),
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
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}