import 'package:flutter/material.dart';

import '../add_edit/inner_items/dialog_button.dart';

Future<dynamic> deleteAlertDialog({required BuildContext context, int? id}){
  final title = id == null ? 'Delete all' : 'Delete current';
  return showDialog(
      context: context,
      builder: (c){
        return AlertDialog(
          title: Text(title),
          content: const Text('Are you sure you want to perform delete operation ?'),
          actions: [
            DialogButton(
              title: 'Cancel',
              onTap: () => Navigator.pop(context, false),
            ),
            DialogButton(
                title: 'Ok',
                onTap: () => Navigator.pop(context, true)
            )
          ],
        );
      }
  );
}