// ignore_for_file: must_be_immutable
import 'dart:ui';

import 'package:calcugasliter/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? trailing;
  const CustomAppBar({required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) => GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Image(
              image: AssetImage(AssetPath.back),
            ),
          ),
          onTap: () => Get.back(),
        ),
      ),
      actions: trailing,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.all(3.w),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 20.sp,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
