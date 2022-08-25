// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomListTile extends StatelessWidget {
  Widget leading;
  Widget trailing;
  Color? tile_color;
  Color? label_color;

  CustomListTile({
    this.label_color = AppColors.whiteColor,
    this.tile_color = AppColors.blackColor,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: deviceWidth,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: tile_color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            trailing,
          ],
        ),
      ),
    );
  }
}
