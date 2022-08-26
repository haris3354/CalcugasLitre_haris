// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:calcugasliter/Auth/Reset_password/model/changePassword_model.dart';
import 'package:calcugasliter/Auth/login/view/login.dart';
import 'package:calcugasliter/Auth/login/view/login_method.dart';
import 'package:calcugasliter/Auth/signup/model/signup_model.dart';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../services/connectivity_manager.dart';
import '../../utils/routes.dart';

class ResetPasswordController extends GetxController {
  void logout() async {
    showLoading();
    ConnectivityManager? _connectivityManager = ConnectivityManager();

    if (await _connectivityManager.isInternetConnected()) {
      final Map<String, dynamic> data = <String, dynamic>{};
      var response =
          await ApiService.put(NetworkStrings.logoutEndPoint, data, true);
      var body = jsonDecode(response.body);
      if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
        stopLoading();
        box.remove('token');
        box.remove('name');
        box.remove('image');
        box.remove('email');
        if (box.read('isSocial') == true) {
          box.remove('isSocial');
        }
        Logger().i(body);
        Get.offAll(const LoginMethod());
      } else if (response.statusCode == NetworkStrings.UNAUTHORIZED_CODE) {
        Get.offAll(const LoginMethod());
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
