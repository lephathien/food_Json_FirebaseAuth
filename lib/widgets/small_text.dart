import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double? height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 13,
      this.height = 1.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}
