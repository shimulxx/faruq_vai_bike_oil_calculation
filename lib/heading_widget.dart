import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff0d09c),
      height: 30,
      child: Row(
        children: const [
          HeadingNameInnerWidget(title: 'Date',),
          HeadingNameInnerWidget(title: 'Kilometer',),
          HeadingNameInnerWidget(title: 'Litre',),
          HeadingNameInnerWidget(title: 'Operation',),
        ],
      ),
    );
  }
}

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