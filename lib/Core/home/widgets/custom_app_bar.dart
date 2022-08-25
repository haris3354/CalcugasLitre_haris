//----------------- APPBAR-----------------------//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_path.dart';

AppBar customAppBar(BuildContext context) => AppBar(
      leading: Builder(
        builder: (BuildContext context) => GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(AssetPath.menu),
            ),
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.all(6.w),
        child: const Text(AppStrings.home),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [],
    );
