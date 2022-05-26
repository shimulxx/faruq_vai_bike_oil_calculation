import 'package:flutter/material.dart';
import 'inner_items/dialog_button.dart';
import 'inner_items/dialog_input_widget.dart';

Future<dynamic> addEditAlertDialog({
  required BuildContext context,
  required bool isAddOperation,
  required String initialMeterValue,
  required String initialLitreValue
}){

  final title = isAddOperation ? 'Add New Item' : 'Edit New Item';

  return showDialog(
      context: context,
      builder: (c){
        var meterValue = initialMeterValue;
        var litreValue = initialLitreValue;
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogInputWidget(
                hintText: 'Meter(km)',
                initialValue: meterValue,
                onTextChange: (value) => meterValue = value,
              ),
              const SizedBox(height: 5,),
              DialogInputWidget(
                hintText: 'Litre',
                initialValue: litreValue,
                onTextChange: (value) => litreValue = value,
              ),
            ],
          ),
          actions: [
            DialogButton(
              title: 'Cancel',
              onTap: () => Navigator.pop(context),
            ),
            DialogButton(
              title: 'Ok',
              onTap: () => Navigator.pop(context, {'add' : isAddOperation, 'meter' : meterValue, 'litre' : litreValue})
            )
          ],
        );
      }
  );
}





