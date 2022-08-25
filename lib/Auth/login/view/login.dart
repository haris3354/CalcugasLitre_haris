// ignore_for_file: prefer_const_constructors

import 'package:calcugasliter/Auth/fogot_password/view/forgot_password.dart';
import 'package:calcugasliter/Auth/login/controller/login_controller.dart';

import 'package:calcugasliter/utils/routers.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/field_validators.dart';
import '../../../utils/routes.dart';
import '../../../widgets/center_logo.dart';
import '../../../widgets/simple_button.dart';

class Login extends GetView<LoginController> {
  @override
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.loginFormKey,
            child: Column(
              children: [
                SizedBox(height: 120.h),
                CenterLogo(
                  logoWidth: 150.w,
                  logoHeight: 150.w,
                ),
                SizedBox(height: 30.h),
                CustomTextfield(
                  hint_Text: AppStrings.email,
                  onSaved: (value) {
                   return controller.email = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateEmail(value!);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  isSuffixIcon: true,
                  isPasswordField: true,
                  hint_Text: AppStrings.password,
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validatePassword(value!);
                  },
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinkWidget(
                      text: AppStrings.forgotPassword,
                      onButtonPressed: () {
                        Get.to(ForgotPassword());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.login.toUpperCase(),
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.checkLogin();
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
