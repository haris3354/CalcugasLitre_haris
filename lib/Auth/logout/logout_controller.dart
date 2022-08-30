// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:calcugasliter/Auth/login/view/login_method.dart';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../../services/connectivity_manager.dart';

class LogoutController extends GetxController {
  void logout() async {
    ConnectivityManager? _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected()) {
      try {
        showLoading();
        final Map<String, dynamic> data = <String, dynamic>{};
        var response = await ApiService.post(
            NetworkStrings.logoutEndPoint, null,
            isHeader: true);
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
          Get.offAll(const LoginMethod());
        } else if (response.statusCode == NetworkStrings.UNAUTHORIZED_CODE) {
          Get.offAll(const LoginMethod());
        } else {
          stopLoading();
          customSnackBar(body['message']);
        }
      } catch (e) {
        stopLoading();
        print(e);
        customSnackBar(AppStrings.somethingWentWrong);
      }
    } else {
      stopLoading();
      customSnackBar(AppStrings.noInternetConnection);
    }
  }
}
