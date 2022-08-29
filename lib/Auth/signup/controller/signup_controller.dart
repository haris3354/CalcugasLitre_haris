// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:calcugasliter/Auth/signup/model/signup_model.dart';
import 'package:calcugasliter/Auth/verify_otp/view/verify_otp.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../services/connectivity_manager.dart';
import '../../../utils/routes.dart';

bool isSignup = false;

class SignUpController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController;

  final box = GetStorage();
  var name = '';
  var email = '';
  var password = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
  }

  void checkSignUp() async {
    isSignup = true;
    update();
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      signupFormKey.currentState!.save();
      showLoading();
      ConnectivityManager? _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected()) {
        print('form Valid');
        final Map<String, dynamic> data = <String, dynamic>{};
        data['full_name'] = name;
        data['user_email'] = email;
        data['user_password'] = password;
        data['confirm_password'] = confirmPassword;

        var response =
            await ApiService.post(NetworkStrings.signupEndpoint, data);

        var body = jsonDecode(response.body);

        if (response.statusCode == NetworkStrings.SUCCESS_CREATED_CODE) {
          stopLoading();
          var obj = SignupResponse.fromJson(body);
          customSnackBar("SignUp SucessFully");
          box.write('Token', obj.user.userAuthentication);
          Get.to(VerifyOtp(), arguments: [obj.user.id]);
        }
        if (response.statusCode != NetworkStrings.SUCCESS_CREATED_CODE) {
          stopLoading();
          customSnackBar(body['msg']);
        }
      } else {
        stopLoading();
        customSnackBar('No Internet Connection');
      }
    }
  }
}
