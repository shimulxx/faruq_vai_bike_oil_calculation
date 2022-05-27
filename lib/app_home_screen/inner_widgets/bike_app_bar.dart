import 'package:flutter/material.dart';

import '../../app_constants/app_colors.dart';

class BikeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BikeAppBar({
    Key? key,
    required this.onPressAdd,
    required this.onPressClear,
  }) : super(key: key);

  final Function() onPressAdd, onPressClear;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppBarColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('BIKE MILEAGE CALCULATOR'),
          Row(
            children: [
              GestureDetector(
                onTap: onPressAdd,
                child: const AbsorbPointer(child: Icon(Icons.add)),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: onPressClear,
                child: const AbsorbPointer(child: Icon(Icons.clear_all)),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}