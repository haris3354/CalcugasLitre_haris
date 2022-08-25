import 'dart:convert';
import 'package:calcugasliter/Core/fuel/add_fuel/model/fuel.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetFuelController extends GetxController {
  var carFuels = <Car>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void fetchFuels(String carId) async {
    isloading(false);
    var response =
        await ApiService.getApi(NetworkStrings.getFuelEndPoint + carId);
    var body = jsonDecode(response.body);
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      var val = FuelsResponseModel.fromJson(body);
      carFuels.value = val.car!;
      isloading(true);
      //print(carFuels.value.length);
      // print(carFuels.value);
    } else {}
  }
}
