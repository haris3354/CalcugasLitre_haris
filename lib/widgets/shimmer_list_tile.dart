import 'package:calcugasliter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_text.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              margin: EdgeInsets.only(left: 22.w),
              width: 0.87.sw,
              height: 90.h,
              color: Colors.black,
              child: CustomText(fontSize: 15.sp, text: ''),
            ),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: AppColors.highlightColor,
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 200.w,
              child: Shimmer.fromColors(
                baseColor: AppColors.blackColor,
                highlightColor: AppColors.highlightColor,
                child: Container(
                  color: Colors.black,
                  width: 100.w,
                  height: 50.h,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
