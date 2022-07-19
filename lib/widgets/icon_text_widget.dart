import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconcolor;
  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = const Color(0xFF332d2b),
      required this.iconcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
          size: 20,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
