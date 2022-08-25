import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Image button_icon;
  // ignore: non_constant_identifier_names
  String button_label;
  Color button_color;
  Color? label_color;
  VoidCallback onButtonPressed;
  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  CustomButton(
      {this.label_color = AppColors.whiteColor,
      this.button_color = AppColors.blackColor,
      required this.button_icon,
      required this.button_label,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onButtonPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Container(
          width: deviceWidth,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: button_color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button_icon,
              SizedBox(
                width: 10.w,
              ),
              Text(
                button_label,
                style: TextStyle(
                  color: label_color,
                  //fontFamily: 'MyLove',
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
