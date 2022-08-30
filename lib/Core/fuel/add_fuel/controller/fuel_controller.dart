import 'dart:convert';
import 'package:calcugasliter/Core/home/view/home.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FuelController extends GetxController {
  // var fuelsList = Get.find<GetFuelController>().carFuels;
  final GlobalKey<FormState> addFuelFormKey = GlobalKey<FormState>();
  late TextEditingController fuelPriceController, fuelQuantityController;

  var fuelprice = '';
  var fuelQuantity = '';
  @override
  void onInit() {
    super.onInit();
    fuelPriceController = TextEditingController();
    fuelQuantityController = TextEditingController();
  }

  @override
  void onClose() {
    fuelPriceController.dispose();
    fuelQuantityController.dispose();
  }

  void addFuel(String carId) async {
    final isValid = addFuelFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ConnectivityManager? connectivityManager = ConnectivityManager();
      if (await connectivityManager.isInternetConnected()) {
        try {
          showLoading();
          addFuelFormKey.currentState!.save();
          final Map<String, dynamic> data = <String, dynamic>{};
          data['fuelPrice'] = fuelprice;
          data['fuelQuantity'] = fuelQuantity;
          data["carId"] = carId;
          var response = await ApiService.post(
              NetworkStrings.addFuelEndPoint, data,
              isHeader: true);
          var body = jsonDecode(response.body);
          if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
            stopLoading();
            Get.offAll(const Home());
            customSnackBar(body['message']);
            fuelPriceController.clear();
            fuelQuantityController.clear();
          } else {
            stopLoading();
          }
        } catch (_) {
          stopLoading();
          customSnackBar(AppStrings.somethingWentWrong);
        }
      } else {
        stopLoading();
        customSnackBar(AppStrings.noInternetConnection);
      }
    }
  }
}
