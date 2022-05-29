import 'package:flutter/material.dart';
import '../../heading_widget/inner_widget/heading_inner.dart';

class ListInnerItem extends StatelessWidget {
  const ListInnerItem({
    Key? key,
    required this.date,
    required this.kilometers,
    required this.litres,
    required this.onPressDelete,
    required this.onPressEdit,
    required this.kmPerLitre,
  }) : super(key: key);

  final String date, kilometers, litres, kmPerLitre;

  final Function()  onPressEdit, onPressDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            HeadingNameInnerWidget(title: date,),
            HeadingNameInnerWidget(title: kilometers,),
            HeadingNameInnerWidget(title: litres,),
            HeadingNameInnerWidget(title: kmPerLitre,),
            OperationWidget(onPressDelete: onPressDelete, onPressEdit: onPressEdit)
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
  }) : super(key: key);

  final Function()  onPressEdit, onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children:  [
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
