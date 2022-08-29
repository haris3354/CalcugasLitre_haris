// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:calcugasliter/Core/fuel/calculate_fuel/view/history.dart';
import 'package:calcugasliter/Core/stats/stats.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

PreferredSizeWidget? appBar(BuildContext context, String title) => CustomAppBar(
      title: title,
      trailing: [
        PopupMenuButton<int>(
          color: Colors.white,
          position: PopupMenuPosition.over,
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  CustomText(
                    fontSize: 15.sp,
                    text: 'History',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.table_chart,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  CustomText(
                    fontSize: 15.sp,
                    text: 'Stats',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );

onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Get.to(History());
      break;
    case 1:
      Get.to(Stats());
      break;
  }
}
