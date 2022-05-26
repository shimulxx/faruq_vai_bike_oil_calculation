import 'package:flutter/material.dart';

class DialogInputWidget extends StatelessWidget {

  const DialogInputWidget({
    Key? key,
    required this.hintText,
    required this.onTextChange,
    required this.initialValue,
  }) : super(key: key);

  final String hintText, initialValue;
  final Function(String) onTextChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onTextChange,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFCDD6F6),
        border: InputBorder.none,
      ),
    );
  }
}