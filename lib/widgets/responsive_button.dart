import 'package:flutter/material.dart';
import 'package:flutter_cubic/misc/AppColors.dart';
import 'package:flutter_cubic/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final double height;
  final String text;
  final Color textColor;

  const ResponsiveButton({
    Key? key,
    this.text = "",
    this.textColor = Colors.white,
    this.isResponsive = false,
    this.width = 20,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: isResponsive ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              AppText(text: text, color:textColor),
              Image.asset("img/button-one.png"),
            ],
          ),
        ),
      ),
    );
  }
}
