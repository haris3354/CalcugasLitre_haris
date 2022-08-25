import 'package:calcugasliter/Auth/verify_otp/controller/verify_otp_controller.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/field_validators.dart';
import '../../../utils/routes.dart';
import '../../../widgets/center_logo.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/simple_button.dart';

class VerifyOtp extends StatelessWidget {
  VerifyOtp({Key? key}) : super(key: key);
  final controller = Get.put(VerifyOtpController());
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: controller.verifyOtpFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120.h),
                CenterLogo(
                  logoWidth: 150.w,
                  logoHeight: 150.w,
                ),
                SizedBox(height: 30.h),
                CustomText(
                  fontSize: 17.sp,
                  text: AppStrings.enterOtpVerification.toUpperCase(),
                  color: Colors.white,
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  fieldType: TextInputType.number,
                  hint_Text: '',
                  isPasswordField: true,
                  isCenterText: true,
                  onSaved: (value) {
                    controller.otp = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateOtp(value!);
                  },
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          fontSize: 12.sp,
                          text: AppStrings.didnotRecieveCode,
                          color: AppColors.whiteColor,
                        ),
                        GetBuilder<VerifyOtpController>(
                          builder: (builder) => LinkWidget(
                            text: AppStrings.resend.toUpperCase(),
                            fontSize: 12.sp,
                            isUnderLine: true,
                            onButtonPressed: () {
                              if (VerifyOtpController.count == 0) {
                                VerifyOtpController().resendOtp();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<VerifyOtpController>(
                      builder: (builder) => CustomText(
                          fontSize: 12.sp,
                          text: '00 :${VerifyOtpController.count} ',
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.continuee.toUpperCase(),
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.checkOtp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
