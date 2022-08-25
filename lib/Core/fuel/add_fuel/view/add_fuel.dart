// ignore_for_file: prefer_const_constructors
import 'package:calcugasliter/Core/fuel/add_fuel/controller/fuel_controller.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AddFuel extends StatelessWidget {
  final String carId;
  AddFuel(this.carId, {Key? key}) : super(key: key);
  final controller = Get.put(FuelController());
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
        appBar: CustomAppBar(title: AppStrings.addFuel),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.addFuelFormKey,
              child: Column(
                children: [
                  _calendar(context),
                  SizedBox(height: 30.h),
                  CustomTextfield(
                    fieldType: TextInputType.number,
                    hint_Text: AppStrings.addFuelPrice,
                    textController: controller.fuelPriceController,
                    fieldValidator: (value) =>
                        FieldValidator.validateEmpty(value!),
                    onSaved: (value) {
                      controller.fuelprice = value!;
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomTextfield(
                    fieldType: TextInputType.number,
                    hint_Text: AppStrings.addFuelInLitres,
                    textController: controller.fuelQuantityController,
                    fieldValidator: (value) =>
                        FieldValidator.validateEmpty(value!),
                    onSaved: (value) {
                      controller.fuelQuantity = value!;
                    },
                  ),
                  SizedBox(height: 60.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SimpleButton(
                      button_label: AppStrings.save,
                      onButtonPressed: () {
                        controller.addFuel(carId);
                      },
                      button_color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _calendar(BuildContext context) => Container(
      height: 300.h,
      width: double.infinity,
      color: Colors.black,
      child: TableCalendar(
        shouldFillViewport: true,
        //      availableCalendarFormats =  {CalendarFormat.month : 'Month'},
        headerStyle: HeaderStyle(
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
          decoration: BoxDecoration(
              //  color: AppColors.blackColor,
              ),
          titleTextStyle: TextStyle(color: AppColors.whiteColor),
          titleCentered: true,
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
          todayDecoration:
              BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          weekendTextStyle: TextStyle(color: AppColors.whiteColor),
          defaultTextStyle: TextStyle(color: AppColors.whiteColor),
          holidayTextStyle: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
        focusedDay: DateTime.now(),
        firstDay: DateTime(2010, 1, 1),
        lastDay: DateTime(2050, 1, 1),
      ),
    );
