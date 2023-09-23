import 'package:flutter/material.dart';
import 'package:flutter_cubic/misc/AppColors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final double height;

  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 20,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("img/button-one.png"),
        ],
      ),
    );
  }
}
