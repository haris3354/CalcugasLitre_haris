// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:calcugasliter/Core/AllCars/model/allcars_model.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../screens/carDetails.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/network_strings.dart';
import '../../../widgets/custom_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

Widget carListTile(BuildContext context, String carName, String imagePath,
        Cars cardetails) =>
    GestureDetector(
      onTap: () {
        Get.to(CarDetails(cardetails));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 22.w),
                width: 0.87.sw,
                height: 90.h,
                color: Colors.black,
                child:
                    CustomText(fontSize: 15.sp, text: AppStrings.fridayBMWX3),
              ),
              Container(
                width: 130.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: NetworkStrings.imageBaseUrl + imagePath,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => shimmerAvatar(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                left: 200.w,
                child: CustomText(fontSize: 17.sp, text: carName),
              ),
            ],
          ),
        ],
      ),
    );

Widget shimmerAvatar() => Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: AppColors.highlightColor,
      child: Container(
        width: 130.w,
        height: 130.h,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
