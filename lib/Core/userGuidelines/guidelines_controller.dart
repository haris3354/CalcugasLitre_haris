// ignore_for_file: annotate_overrides, no_leading_underscores_for_local_identifiers
import 'dart:convert';
import 'package:calcugasliter/Core/userGuidelines/user_guidelines_model.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Content {
  termsAndConditions,
  privacyPolicy,
}

class ContentController extends GetxController {
  List<GuideLines>? data;
  RxBool isLoading = false.obs;

  @override
  void onInit() {}
  void fetchGuideLine(String endPoint) async {
    isLoading(false);
    var response = await ApiService.getApi(endPoint);
    var body = jsonDecode(response.body);
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      debugPrint(response.statusCode.toString());
      var obj = UserGuideLinesModel.fromJson(body);
      data = obj.message!;
      update();
      isLoading(true);
    } else {
      stopLoading();
      debugPrint(response.statusCode.toString());
      customSnackBar(body['message']);
    }
  }
}
