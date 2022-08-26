// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:convert';
import 'package:calcugasliter/Auth/login/view/login_method.dart';
import 'package:calcugasliter/Auth/update_password/view/update_password.dart';
import 'package:calcugasliter/screens/subscription.dart';
import 'package:calcugasliter/Core/userGuidelines/views/terms_and_conditions.dart';
import 'package:calcugasliter/Core/userGuidelines/views/privacy_policy.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/asset_path.dart';
import 'splash_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(title: AppStrings.settings),
          body: Column(
            children: [
              SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.subscription,
                  onButtonPressed: () {
                    Get.to(Subscription());
                  }),
              if (box.read('isSocial') == null)
                SimpleButton(
                    button_color: AppColors.blackColor,
                    button_label: AppStrings.updatePassword,
                    onButtonPressed: () {
                      Get.to(UpdatePassword());
                    }),
              SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.privacyPolicy,
                  onButtonPressed: () {
                    Get.to(PrivacyPolicy());
                  }),
              SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.termsAndConditions,
                  onButtonPressed: () {
                    Get.to(TermsAndCondition());
                  }),
              SimpleButton(
                button_color: AppColors.blackColor,
                button_label: AppStrings.logout,
                onButtonPressed: () {
                  box.remove('isSocial');
                  logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void logout() async {
  showLoading();
  final Map<String, dynamic> data = <String, dynamic>{};
  var response =
      await ApiService.postWithHeader(NetworkStrings.logoutEndPoint, null);
  var body = jsonDecode(response.body);
  if (response.statusCode == 200) {
    box.remove('token');
    box.remove('verified');
    Logger().i(body);
    Get.offAll(LoginMethod());
  } else {
    stopLoading();
    customSnackBar(body['message']);
  }
}
