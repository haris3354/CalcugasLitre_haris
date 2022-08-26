import 'package:cached_network_image/cached_network_image.dart';
import 'package:calcugasliter/Auth/profile/view/edit_profile.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/view/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../screens/settings.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/asset_path.dart';
import '../../../widgets/custom_text.dart';

//---------------------- CustomDrawer---------------------------//

Widget customDrawer(
        BuildContext context, String name, String? imagePath, String? email) =>
    Drawer(
      width: 0.7.sw,
      backgroundColor: AppColors.blackColor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120.h,
            child: DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      // alignment: WrapAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: AppColors.whiteColor),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imagePath!,
                            width: 50.w,
                            height: 50.h,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                shimmerAvatar(50.w, 50.h),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //                    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  fontSize: 12.sp,
                                  text: name,
                                  color: AppColors.whiteColor,
                                ),
                                CustomText(
                                  fontSize: 10.sp,
                                  text: email!,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Logger().e(imagePath);
                      Get.to(EditProfile());
                    },
                    child: Image.asset(
                      AssetPath.edit,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _customDrawerPage(context, AssetPath.home, 'Home', () {}, Colors.red),
          _customDrawerPage(context, AssetPath.calendar, 'Calendar', () {
            Get.back();
            Get.to(const Calendar());
          }, null),
          _customDrawerPage(context, AssetPath.settings, 'Settings', () {
            //   Navigator.pop(context);
            Get.back();
            Get.to(const Settings());
          }, null),
        ],
      ),
    );
//------------------ DrawerPage---------------------------//

Widget _customDrawerPage(BuildContext context, String imagePath,
    String pageName, Function()? onTap, Color? tilecolor) {
  return ListTile(
    tileColor: tilecolor ?? Colors.black,
    leading: Image.asset(
      imagePath,
      width: 25.w,
      height: 25.h,
    ),
    title: Text(
      pageName,
      style: const TextStyle(
        color: AppColors.whiteColor,
      ),
    ),
    onTap: onTap,
  );
}

Widget shimmerAvatar(double width, double height) => Shimmer.fromColors(
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightColor,
      child: Container(
        width: width,
        height: height,
        color: Colors.black,
      ),
    );
