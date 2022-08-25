import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Auth/login/view/login.dart';
import '../Core/userGuidelines/views/terms_and_conditions.dart';
import '../Core/userGuidelines/views/privacy_policy.dart';
import '../utils/app_colors.dart';
import 'Custom_SnackBar.dart';
import 'custom_text.dart';
import 'link_widget.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

bool check1 = false;
bool check2 = false;

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          CustomText(
            color: Colors.red,
            fontSize: 15.sp,
            text: 'AGREEMENT',
          ),
          SizedBox(height: 10.h),
          CustomText(
            color: Colors.black,
            fontSize: 15.sp,
            text: 'I have  read and accept',
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Checkbox(
                value: check1,
                onChanged: (bool? value) {
                  setState(() {
                    check1 = value!;
                  });
                },
              ),
              LinkWidget(
                color: AppColors.blackColor,
                text: 'Terms and Conditions',
                onButtonPressed: () {
                  Get.to(TermsAndCondition());
                },
              ),
            ],
          ),
          //SizedBox(height: 2.h),
          Row(
            children: [
              Checkbox(
                value: check2,
                onChanged: (bool? value) {
                  setState(() {
                    check2 = value!;
                  });
                },
              ),
              LinkWidget(
                color: AppColors.blackColor,
                text: 'Privacy Policy',
                onButtonPressed: () {
                  Get.to(PrivacyPolicy());
                },
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    check1 = false;
                    check2 = false;
                    Get.back();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30)),
                      color: Colors.grey,
                    ),
                    height: 45.h,
                    child: const Center(
                      child: Text('Reject'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (check1 == true && check2 == true) {
                      check1 = false;
                      check2 = false;
                      Get.off(Login());
                    } else if (check1 == false && check2 == true) {
                      customSnackBar('Check Terms and Conditions to proceed');
                    } else if (check1 == true && check2 == false) {
                      customSnackBar('Check  privacy policy  to proceed');
                    } else {
                      customSnackBar('Check All fields to proceed');
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30)),
                      color: Colors.red,
                    ),
                    height: 45.h,
                    child: const Center(
                      child: Text('Accept'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
