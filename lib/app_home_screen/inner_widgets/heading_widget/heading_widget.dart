import 'package:flutter/material.dart';
import 'inner_widget/heading_inner.dart';

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
          HeadingNameInnerWidget(title: 'Km',),
          HeadingNameInnerWidget(title: 'Ltr',),
          HeadingNameInnerWidget(title: 'km/ltr',),
          HeadingNameInnerWidget(title: 'Operation',),
        ],
      ),
    );
  }
}

