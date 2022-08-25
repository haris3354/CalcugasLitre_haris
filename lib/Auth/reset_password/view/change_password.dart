// ignore_for_file: override_on_non_overriding_member

import 'package:calcugasliter/Auth/reset_password/controller/reset_password_controller.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/field_validators.dart';
import '../../../utils/routes.dart';
import '../../../widgets/center_logo.dart';
import '../../../widgets/simple_button.dart';

class ResetPassword extends GetView<ResetPasswordController> {
  @override
  final controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: controller.resetPasswordFormKey,
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
                CustomTextfield(
                    isSuffixIcon: true,
                  isPasswordField: true,
                  hint_Text: AppStrings.enterNewPassword,
                  textController: controller.passwordController,
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validatePassword(value!);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  isSuffixIcon: true,
                  isPasswordField: true,
                  hint_Text: AppStrings.confirmPassword,
                  textController: controller.confirmPasswordController,
                  onSaved: (value) {
                    controller.confirmPassword = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateConfirmPassword(
                        value!, controller.passwordController.text);
                  },
                ),
                SizedBox(height: 21.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.continuee.toUpperCase(),
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.checkResetPassword();
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
