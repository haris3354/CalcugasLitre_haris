import 'package:calcugasliter/screens/carDetails.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

Widget shimmerTable() => Column(
      children: [
        Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 5,
              color: Colors.transparent,
            ),
          ),
          child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return Shimmer.fromColors(
                    baseColor: AppColors.baseColor,
                    highlightColor: AppColors.highlightColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.grey,
                        width: 50,
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 50,
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 80,
                        height: 20,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
