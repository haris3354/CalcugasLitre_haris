// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors
import 'package:calcugasliter/Auth/fogot_password/model/Forgot_password_model.dart';
import 'package:calcugasliter/Auth/login/model/login_model.dart';
import 'package:calcugasliter/Auth/verify_otp/view/verify_otp.dart';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  void checkEmail() async {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {

      showLoading();
      ConnectivityManager? _connectivityManager = ConnectivityManager();

      if (await _connectivityManager.isInternetConnected()) {
         forgotPasswordFormKey.currentState!.save();
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_email'] = email;

      var response =
          await ApiService.post(NetworkStrings.forgotPasswordEndpoint, data);
      var body = jsonDecode(response.body);
      Logger().i(body);
      if (response.statusCode == 200) {
        stopLoading();
        customSnackBar(body['msg']);
        var obj = ForgotPasswordResponseModel.fromJson(body);
        Get.off(VerifyOtp(), arguments: [body["userId"]]);
      } else {
           stopLoading();
        customSnackBar(body['msg']);
      }

      } else {
           stopLoading();
        customSnackBar('No Internet Connection');
      }
      
    }
  }

  //------------
}
