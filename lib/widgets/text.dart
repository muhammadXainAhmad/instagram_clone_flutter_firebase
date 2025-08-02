import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color textClr;
  final double textSize;
  const MyText({
    super.key,
    required this.text,
    required this.textClr,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: textClr, fontSize: textSize));
  }
}
