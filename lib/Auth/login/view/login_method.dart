// ignore_for_file: prefer_const_constructors

import 'package:calcugasliter/Auth/signup/view/4)signup.dart';

import 'package:calcugasliter/Auth/login/view/social_login.dart';
import 'package:calcugasliter/widgets/Exit_Confirmation.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/link_widget.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';

import '../../../widgets/center_logo.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/simple_button.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => exitConfirmationDialog(context),
      ),
      child: BackgroundImageWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              CenterLogo(
                logoWidth: 150.w,
                logoHeight: 150.w,
              ),
              SizedBox(height: 30.h),
              SimpleButton(
                label_color: AppColors.dimWhiteColor,
                button_color: AppColors.blackColor,
                button_label: AppStrings.socialLogin,
                onButtonPressed: () {
                  scaleDialog(context, 0);
                },
              ),
              SimpleButton(
                label_color: AppColors.dimWhiteColor,
                button_color: AppColors.blackColor,
                button_label: AppStrings.emailLogin,
                onButtonPressed: () async {
                  scaleDialog(context, 1);
                },
              ),
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: 12.sp,
                    text: AppStrings.dontHaveAnAccount,
                    color: AppColors.whiteColor,
                  ),
                  LinkWidget(
                    isUnderLine: true,
                    text: AppStrings.signupToday,
                    onButtonPressed: () {
                      Get.to(Signup());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
