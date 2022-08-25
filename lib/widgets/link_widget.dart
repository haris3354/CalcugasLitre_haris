// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkWidget extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final String text;
  bool isUnderLine;
  double? fontSize;
  Color? color;
  LinkWidget(
      {Key? key,
      this.color,
      this.fontSize,
      this.isUnderLine = false,
      required this.text,
      required this.onButtonPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 15.sp,
          decoration:
              isUnderLine ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
