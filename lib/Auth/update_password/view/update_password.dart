import 'package:calcugasliter/Auth/update_password/controller/update_password_controller.dart';
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/routes.dart';
import '../../../widgets/center_logo.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/simple_button.dart';

class UpdatePassword extends GetView<UpdatePasswordController> {
  UpdatePassword({Key? key}) : super(key: key);
  final controller = Get.put(UpdatePasswordController());
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.updatePasswordFormKey,
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
                  text: AppStrings.updatePassword2.toUpperCase(),
                  color: Colors.white,
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  isSuffixIcon: true,
                  isPasswordField: true,
                  hint_Text: AppStrings.enterOldPassword,
                  textController: controller.oldpasswordController,
                  onSaved: (value) {
                    controller.oldpassword = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validatePassword(value!);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                    isSuffixIcon: true,
                    isPasswordField: true,
                    textController: controller.newpasswordController,
                    hint_Text: AppStrings.enterNewPAssword,
                    onSaved: (value) {
                      controller.newpassword = value!;
                    },
                    fieldValidator: (value) {
                      return FieldValidator.validatePassword(value!);
                    }),
                SizedBox(height: 7.h),
                CustomTextfield(
                  hint_Text: AppStrings.confirmPassword,
                  onSaved: (value) {
                    controller.confirmPassword = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateConfirmPassword(
                        value!, controller.newpasswordController.text);
                  },
                ),
                SizedBox(height: 7.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.continuee.toUpperCase(),
                  onButtonPressed: () {
                    controller.checkUpdatePassword();
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
