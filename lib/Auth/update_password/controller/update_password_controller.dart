// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:calcugasliter/Auth/signup/model/signup_model.dart';
import 'package:calcugasliter/Auth/verify_otp/view/verify_otp.dart';
import 'package:calcugasliter/Core/home/view/home.dart';
import 'package:calcugasliter/screens/settings.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../../services/connectivity_manager.dart';
import '../../../utils/routes.dart';

bool isSignup = false;

class UpdatePasswordController extends GetxController {
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController oldpasswordController,
      newpasswordController,
      confirmPasswordController;

  final box = GetStorage();

  var oldpassword = '';
  var newpassword = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    oldpasswordController = TextEditingController();
    newpasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    oldpasswordController.clear();
    newpasswordController.clear();
    confirmPasswordController.clear();
  }

  void checkUpdatePassword() async {
    final isValid = updatePasswordFormKey.currentState!.validate();
    print('form Not Valid');
    if (!isValid) {
      return;
    } else {
      showLoading();
      ConnectivityManager? _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected()) {
        updatePasswordFormKey.currentState!.save();
        print('form Valid');
        final Map<String, dynamic> data = <String, dynamic>{};
        data['old_password'] = oldpassword;
        data['new_password'] = confirmPassword;
        var response = await ApiService.put(
            NetworkStrings.updatePasswordEndPoint, data, true);
        var body = jsonDecode(response.body);
        if (response.statusCode == NetworkStrings.SUCCESS_CODE &&
            body["status"] == 1) {
          stopLoading();
          customSnackBar("Password updated Successfully");
          onClose();
          Get.offAll(const Home());
        } else if (response.statusCode == 400) {
          print(response.body);
          stopLoading();
          customSnackBar('Old password is wrong');
        } else {
          stopLoading();
          customSnackBar(body['message']);
        }
      } else {
        stopLoading();
        customSnackBar('No Internet Connection');
      }
    }
  }
}
