import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroudColor;
  final Color iconColor;
  final double size;
  AppIcon(
      {Key? key,
      required this.icon,
      this.backgroudColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756dd54),
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroudColor,
      ),
      child: Icon(
        icon,
        size: 16,
      ),
    );
  }
}
