import 'package:flutter/material.dart';

class HeadingNameInnerWidget extends StatelessWidget {
  const HeadingNameInnerWidget({
    Key? key,
    required this.title
  }) : super(key: key);

  final headingTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(title, style: headingTextStyle, textAlign: TextAlign.center,));
  }
}