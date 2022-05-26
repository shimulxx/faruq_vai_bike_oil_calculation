import 'package:flutter/material.dart';
import 'heading_widget.dart';

class ListInnerItem extends StatelessWidget {
  const ListInnerItem({
    Key? key,
    required this.date,
    required this.kilometers,
    required this.litres,
    required this.onPressView,
    required this.onPressDelete,
    required this.onPressEdit,
  }) : super(key: key);

  final String date, kilometers, litres;

  final Function() onPressView, onPressEdit, onPressDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            HeadingNameInnerWidget(title: date,),
            HeadingNameInnerWidget(title: kilometers,),
            HeadingNameInnerWidget(title: litres,),
            OperationWidget(onPressDelete: onPressDelete, onPressEdit: onPressEdit,onPressView: onPressView,)
          ],
        ),
      ),
    );
  }
}

class OperationWidget extends StatelessWidget {

  const OperationWidget({
    Key? key,
    required this.onPressEdit,
    required this.onPressDelete,
    required this.onPressView,
  }) : super(key: key);

  final Function() onPressView, onPressEdit, onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children:  [
          Expanded(
            child: GestureDetector(
              onTap: onPressView,
              child: const AbsorbPointer(child: Icon(Icons.remove_red_eye, color: Color(0xff038006)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onPressEdit,
              child: const AbsorbPointer(child: Icon(Icons.edit, color: Color(0xff047abd)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onPressDelete,
              child: const AbsorbPointer(child: Icon(Icons.delete, color: Color(0xffd10404))),
            ),
          ),
        ],
      ),
    );
  }
}
