import 'package:flutter/material.dart';
import 'package:flutter_cubic/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double size;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;

  bool isIcon = false;

  AppButtons({
    Key? key,
    this.text = "",
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    isIcon = icon != null;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: isIcon
            ? Icon(icon, color: color)
            : AppText(text: text!, color: color),
      ),
    );
  }
}
