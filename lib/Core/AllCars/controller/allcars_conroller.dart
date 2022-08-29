import 'dart:convert';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/allcars_model.dart';

class AllCarsController extends GetxController {
  RxList<Cars> carList = <Cars>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    fetchCars();
    super.onInit();
  }

  void fetchCars() async {
    isloading(false);
    var response = await ApiService.getApi(NetworkStrings.allCars);
    var body = jsonDecode(response.body);
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      debugPrint(response.statusCode.toString());
      var obj = AllCarsResponseModel.fromJson(body);
      carList.value = obj.cars!;
      isloading(true);
    } else {
      stopLoading();
      customSnackBar(body['message']);
    }
  }
}
