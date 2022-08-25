// ignore_for_file: annotate_overrides, no_leading_underscores_for_local_identifiers
import 'dart:convert';
import 'package:calcugasliter/Core/fuel/calculate_fuel/model/history_model.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CalculateFuel extends GetxController {
  RxBool isloading = false.obs;
  var totalPrice = 0.obs;
  var totalQuantity = 0.obs;



  void calculateFuel(String fromDate, String toDate) async {
    isloading(false);
    showLoading();
    ConnectivityManager? _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected()) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['fromdate'] = fromDate;
      data['todate'] = toDate;
      var response = await ApiService.postWithHeader(
          NetworkStrings.calculateFuelEndPoint, data);
      var body = jsonDecode(response.body);
      if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
        stopLoading();
        totalPrice.value = body['totalPrice'];
        totalQuantity.value = body['totalQuntity'];
        update();
        isloading(true);
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
