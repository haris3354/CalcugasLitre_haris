// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_final_fields
import 'package:calcugasliter/Core/fuel/calculate_fuel/controller/calculate_fuel_controller.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/widgets/app_bar.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/widgets/date_picker.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/widgets/custom_listtile.dart';
import 'package:calcugasliter/widgets/custom_text.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final DateRangePickerController _controller = DateRangePickerController();
  var calculateFuelController = Get.put(CalculateFuel());
  String _startDate = '', _endDate = '';
  @override
  initState() {
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      _endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(context, AppStrings.calendar),
        body: SingleChildScrollView(
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  datePicker(_controller, selectionChanged),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SimpleButton(
                      button_label: AppStrings.calculate,
                      onButtonPressed: () {
                        calculateFuelController.calculateFuel(
                            _startDate, _endDate);
                      },
                      button_color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomListTile(
                    leading: CustomText(
                      text: AppStrings.fromDate,
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                    trailing: CustomText(
                      text: _startDate,
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomListTile(
                    leading: CustomText(
                      text: AppStrings.toDate,
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                    trailing: CustomText(
                      text: _endDate,
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (calculateFuelController.isloading.value == true) ...[
                    CustomText(
                      fontSize: 16.sp,
                      text: AppStrings.addFuelInLitres,
                      color: Colors.white,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      fontSize: 20.sp,
                      text: calculateFuelController.totalQuantity.value
                          .toString(),
                      color: Colors.white,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      fontSize: 16,
                      text: AppStrings.totalExpenditure,
                      color: Colors.white,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      fontSize: 20.sp,
                      text:
                          '\$ ${calculateFuelController.totalPrice.value.toString()}',
                      color: Colors.white,
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
