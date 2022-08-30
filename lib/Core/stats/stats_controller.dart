// ignore_for_file: library_private_types_in_public_api, invalid_use_of_protected_member

import 'dart:convert';
import 'package:calcugasliter/Core/stats/stats_model.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:get/get.dart';
import '../../services/api_service.dart';
import '../../utils/network_strings.dart';
import '../../widgets/Custom_SnackBar.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class StatsController extends GetxController {
  RxList<Fuel> fuels = <Fuel>[].obs;
  double max = 0;
  bool isLoading = false;
  RxBool isloading = false.obs;
  List<ChartData> data = [];
  var months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  void onInit() {
    fetchStats();
    super.onInit();
  }

  List<ChartData> getChartData() => data;
  Future fetchStats() async {
    try {
      var response = await ApiService.getApi(NetworkStrings.getByMonth);
      var body = jsonDecode(response.body);
      if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
        var obj = StatsModel.fromJson(body);
        fuels.value = obj.fuel!;
        for (int i = 0; i < fuels.value.length; i++) {
          if (max < fuels[i].sum!.toDouble()) {
            max = fuels[i].sum!.toDouble();
          }
          data.add(ChartData(months[i], fuels[i].sum!.toDouble()));
        }
        isLoading = true;
        update();
      } else {
        customSnackBar(body['message']);
      }
    } catch (_) {
        customSnackBar(AppStrings.somethingWentWrong);

    }
  }
}
