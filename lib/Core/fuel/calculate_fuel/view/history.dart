// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:calcugasliter/Core/fuel/calculate_fuel/controller/history_controller.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/widgets/shimmerListView.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/custom_listtile.dart';
import 'package:calcugasliter/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(title: AppStrings.history),
          body: Column(
            children: [
              Expanded(
                child: Obx(
                  () => historyController.isloading.value
                      ? (historyController.historyFuels.isNotEmpty)
                          ? ListView.separated(
                              itemCount: historyController.historyFuels.length,
                              itemBuilder: (context2, index) {
                                int reverseIndex =
                                    historyController.historyFuels.length -
                                        1 -
                                        index;
                                return _historylistTile(
                                  historyController
                                      .historyFuels[reverseIndex].fromdate!
                                      .substring(0, 10),
                                  historyController
                                      .historyFuels[reverseIndex].todate!
                                      .substring(0, 10),
                                  historyController
                                      .historyFuels[reverseIndex].totalQty!,
                                  historyController
                                      .historyFuels[reverseIndex].totalPrice!,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(height: 10.h);
                              },
                            )
                          : Center(
                              child: CustomText(
                                text: AppStrings.noHistory,
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            )
                      : shimmerListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_historylistTile(String startDate, String endDate, int litres, int price) =>
    CustomListTile(
      leading: Column(
        children: [
          CustomText(
            text: startDate,
            fontSize: 15.sp,
            color: AppColors.whiteColor,
          ),
          CustomText(
            text: endDate,
            fontSize: 15.sp,
            color: AppColors.whiteColor,
          ),
        ],
      ),
      trailing: Column(
        children: [
          CustomText(
            text: '$litres Litres',
            fontSize: 15.sp,
            color: AppColors.whiteColor,
          ),
          CustomText(
            text: '\$ $price',
            fontSize: 15.sp,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
