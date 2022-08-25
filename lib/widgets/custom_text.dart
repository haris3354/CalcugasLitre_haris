import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color? color;
  final String? fontFamily;
  final bool? isUnderline;
  CustomText(
      {super.key,
      required this.fontSize,
      required this.text,
      this.color,
      this.fontFamily,
      this.isUnderline = false});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.whiteColor,
        // fontFamily: fontFamily ?? 'MyLove',
        fontSize: fontSize,
        decoration: (isUnderline == true)
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  }
}
