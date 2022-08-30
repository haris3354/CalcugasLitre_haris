import 'dart:convert';
import 'package:calcugasliter/Core/fuel/add_fuel/model/fuel.dart';
import 'package:calcugasliter/services/api_service.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:get/get.dart';

class GetFuelController extends GetxController {
  var carFuels = <Car>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }
  
  void fetchFuels(String carId) async {
    try {
      isloading(false);
      var response =
          await ApiService.getApi(NetworkStrings.getFuelEndPoint + carId);
      var body = jsonDecode(response.body);
      if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
        var val = FuelsResponseModel.fromJson(body);
        carFuels.value = val.car!;
        isloading(true);
      } else {}
    } catch (_) {
      customSnackBar(AppStrings.somethingWentWrong);
    }
  }
}
