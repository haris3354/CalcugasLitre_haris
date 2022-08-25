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

class HistoryController extends GetxController {
  RxList<History> historyFuels = <History>[].obs;
  RxBool isloading = false.obs;
 
  @override
  void onInit() {
     fetchHistory();
  }

  void fetchHistory() async {
    isloading(false);
    var response = await ApiService.getApi(NetworkStrings.history);
    var body = jsonDecode(response.body);
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      debugPrint(response.statusCode.toString());
      var obj = HistoryModel.fromJson(body);
      historyFuels.value = obj.history!;
      isloading(true);
    } else {
      stopLoading();
      debugPrint(response.statusCode.toString());
      customSnackBar(body['message']);
    }
  }

}
