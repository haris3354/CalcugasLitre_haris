// ignore_for_file: body_might_complete_normally_nullable
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/center_logo.dart';
import '../../../widgets/simple_button.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.signupFormKey,
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
                  hint_Text: AppStrings.fullName,
                  textController: controller.nameController,
                  onSaved: (value) {
                    controller.name = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateName(value!);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  hint_Text: AppStrings.email,
                  textController: controller.emailController,
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateEmail(value!);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  isPasswordField: true,
                  isSuffixIcon: true,
                  hint_Text: AppStrings.password,
                  textController: controller.passwordController,
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validatePassword(value!);
                  },
                ),
                SizedBox(height: 7.h),
                CustomTextfield(
                  isPasswordField: true,
                  isSuffixIcon: true,
                  hint_Text: AppStrings.confirmPassword,
                  onSaved: (value) {
                    controller.confirmPassword = value!;
                  },
                  fieldValidator: (value) {
                    return FieldValidator.validateConfirmPassword(
                        value!, controller.passwordController.text);
                  },
                ),
                SizedBox(height: 7.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.continuee.toUpperCase(),
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.checkSignUp();
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
