// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:calcugasliter/Auth/login/view/login.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

dynamic args = Get.arguments;

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  late TextEditingController passwordController, confirmPasswordController;

  var password = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void checkResetPassword() async {
    final isValid = resetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ConnectivityManager? connectivityManager = ConnectivityManager();
      if (await connectivityManager.isInternetConnected()) {
        try {
          resetPasswordFormKey.currentState!.save();
          showLoading();
          final Map<String, dynamic> data = <String, dynamic>{};
          data['user_id'] = args[0];
          data['new_password'] = password;
          var response = await ApiService.put(
              NetworkStrings.changePasswordEndpoint, data, false);
          var body = jsonDecode(response.body);
          if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
            stopLoading();
            customSnackBar(AppStrings.passwordChangedSuccesfully);
            Get.to(Login());
          } else {
            stopLoading();
            customSnackBar(body['message']);
          }
        } catch (_) {
          stopLoading();
          customSnackBar(AppStrings.somethingWentWrong);
        }
      } else {
        stopLoading();
        customSnackBar(AppStrings.noInternetConnection);
      }
    }
  }
}
