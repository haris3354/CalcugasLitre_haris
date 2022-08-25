// ignore_for_file: file_names

import 'package:calcugasliter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

shimmerListView() => ListView.separated(
      itemCount: 10,
      itemBuilder: (context2, index) {
        return Container(
          width: 1.sw,
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Shimmer.fromColors(
              period: const Duration(seconds: 3),
              baseColor: AppColors.baseColor,
              highlightColor: AppColors.highlightColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          width: 100.w,
                          height: 20.h,
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          color: Colors.black,
                          width: 100.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          width: 100.w,
                          height: 20.h,
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          color: Colors.black,
                          width: 100.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 10.h);
      },
    );

Widget shimmer() {
  return Shimmer.fromColors(
    period: const Duration(seconds: 3),
    baseColor: Colors.black54,
    highlightColor: Colors.black12,
    child: Container(
      width: 1.sw,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              width: 10,
              height: 2,
            ),
          ],
        ),
      ),
    ),
  );
}
