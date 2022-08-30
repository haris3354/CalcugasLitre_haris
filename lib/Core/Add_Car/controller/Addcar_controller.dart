// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:calcugasliter/Core/AllCars/controller/allcars_conroller.dart';
import 'package:calcugasliter/Core/home/view/home.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../services/connectivity_manager.dart';
import 'package:http/http.dart' as http;

class AddCarController extends GetxController {
  final GlobalKey<FormState> addCarFormKey = GlobalKey<FormState>();
  var allCarsController = Get.find<AllCarsController>();
  late TextEditingController carNameController,
      carNumberController,
      modelNumberController;

  final box = GetStorage();
  var carName = '';
  var carNumber = '';
  var modelNumber = '';

  @override
  void onInit() {
    super.onInit();
    carNameController = TextEditingController();
    carNumberController = TextEditingController();
    modelNumberController = TextEditingController();
  }

  @override
  void onClose() {
    carNameController.clear();
    carNumberController.clear();
    modelNumberController.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addCar(String? imagePath) async {
    final isValid = addCarFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      ConnectivityManager? connectivityManager = ConnectivityManager();
      if (await connectivityManager.isInternetConnected()) {
        try {
          addCarFormKey.currentState!.save();
          showLoading();

          var token = box.read('token');
          Map<String, String> header = {"Authorization": 'Bearer $token'};
          var uri = Uri.parse('${NetworkStrings.apiBaseUrl}addCar');
          var request = http.MultipartRequest('POST', uri);
          request.headers.addAll(header);
          request.fields['carName'] = carName;
          request.fields['carNumber'] = carNumber;
          request.fields['carModel'] = modelNumber;
          var multipart = http.MultipartFile.fromPath('carImage', imagePath!);
          request.files.add(await multipart);
          var streamResponse = await request.send();
          var response = await http.Response.fromStream(streamResponse);
          if (response.statusCode == 200) {
            stopLoading();
            allCarsController.fetchCars();
            print(response.body);
            allCarsController.carList.refresh();

            Get.offAll(const Home());
            customSnackBar(AppStrings.carAdded);
          } else {
            stopLoading();
            print(response.body);
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
