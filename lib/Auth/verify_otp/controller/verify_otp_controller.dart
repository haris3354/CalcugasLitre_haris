// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'dart:async';
import 'package:calcugasliter/Auth/Reset_password/view/change_password.dart';
import 'package:calcugasliter/Auth/fogot_password/view/forgot_password.dart';
import 'package:calcugasliter/Auth/login/controller/login_controller.dart';
import 'package:calcugasliter/Auth/login/view/login.dart';
import 'package:calcugasliter/Auth/profile/controller/update_profile_controller.dart';
import 'package:calcugasliter/Auth/signup/controller/signup_controller.dart';
import 'package:calcugasliter/Auth/verify_otp/model/Verify_model.dart';
import 'package:calcugasliter/Auth/verify_otp/model/resend_code_model.dart';
import 'package:calcugasliter/Core/home/view/home.dart';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../services/connectivity_manager.dart';

class VerifyOtpController extends GetxController {
  final GlobalKey<FormState> verifyOtpFormKey = GlobalKey<FormState>();
  late TextEditingController otpController;
  final controller = Get.put(updateProfileController());
  var otp = '';
  static var count = 10;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    StartTime();
    otpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    otpController.dispose();
  }

  void checkOtp() async {
    dynamic args = Get.arguments;
    final isValid = verifyOtpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ConnectivityManager? _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected()) {
        showLoading();
        verifyOtpFormKey.currentState!.save();
        final Map<String, dynamic> data = <String, dynamic>{};
        data['user_id'] = args[0];
        data['verificationcode'] = otp;
        Logger().i(data);
        var response =
            await ApiService.post(NetworkStrings.verifyOtpEndpoint, data);
        print(response.body);
        var body = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var obj = VerifyOtpResponseModel.fromJson(body);
          if (isForget == true) {
            stopLoading();
            isForget = false;
            customSnackBar(body['message']);
            Get.off(ResetPassword(), arguments: [args[0]]);
          } else if (obj.data?.verified == 1) {
            stopLoading();
            Get.offAll(Home());
            box.write('token', obj.data?.userAuthentication);
            box.write('verified', obj.data?.verified);
            box.write('id', obj.data?.id);
            controller.setFields(
                obj.data?.fullName, obj.data?.image, obj.data?.userEmail!);
            box.write('name', obj.data?.fullName);
            box.write('email', obj.data?.userEmail);
            box.write('image', obj.data?.image);
            customSnackBar(body['message']);
          }
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

  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  void reset() {
    _timer.cancel();
    count = 30;
    update();
    StartTime();
    resendOtp();
  }

//---------------- Resend Otp-----------------------

  void resendOtp() async {
    showLoading();
    dynamic args = Get.arguments;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args[0];

    print(data);
    var response =
        await ApiService.post(NetworkStrings.resendCodeEndpoint, data);
    print(response.body);

    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      stopLoading();
      var obj = ResendCodeModel.fromJson(body);
      customSnackBar('OTP CODE : ${obj.code}');
    } else {
      stopLoading();
      customSnackBar(body['message']);
    }
  }
}

  //------------

