// ignore_for_file: unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable, must_call_super, must_be_immutable, invalid_use_of_protected_member

import 'package:calcugasliter/Core/AllCars/model/allcars_model.dart';
import 'package:calcugasliter/Core/fuel/add_fuel/controller/get_fuel_controller.dart';
import 'package:calcugasliter/Core/fuel/add_fuel/view/add_fuel.dart';
import 'package:calcugasliter/Core/home/widgets/car_list_tile.dart';
import 'package:calcugasliter/Core/update_Car/update_car.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/shimmer_table.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/asset_path.dart';
import '../widgets/custom_listtile.dart';
import '../widgets/custom_text.dart';

class CarDetails extends StatefulWidget {
  Cars carDetails;
  CarDetails(this.carDetails, {Key? key}) : super(key: key);
  @override
  State<CarDetails> createState() => _CarDetailsState();
}

final getfuelsController = Get.put(GetFuelController());

class _CarDetailsState extends State<CarDetails> {
  @override
  void initState() {
    getfuelsController.fetchFuels(widget.carDetails.id!);
  }

  Widget _fuelsTable() => Obx(
        () => !(getfuelsController.isloading.value)
            ? shimmerTable()
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 10.h,
                    ),
                    height: 100.h,
                    color: AppColors.blackColor,
                    child: getfuelsController.carFuels.isNotEmpty
                        ? ListView.builder(
                            itemCount: getfuelsController.carFuels.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.top,
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(),
                                  children: [
                                    CustomText(
                                      text: '\$ ' +
                                          getfuelsController
                                              .carFuels[index].fuelPrice
                                              .toString(),
                                      fontSize: 15.sp,
                                    ),
                                    CustomText(
                                      text: getfuelsController
                                          .carFuels[index].fuelQuantity
                                          .toString(),
                                      fontSize: 15.sp,
                                    ),
                                    CustomText(
                                      text: getfuelsController
                                          .carFuels[index].createdAt!
                                          .substring(0, 10),
                                      fontSize: 15.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: CustomText(
                              color: Colors.white,
                              fontSize: 20.sp,
                              text: 'No Fuels Added',
                            ),
                          ),
                  ),
                ],
              ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: AppStrings.carDetails,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   AppStrings.carNick.toUpperCase(),
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.w900,
                //     fontSize: 21.sp,
                //   ),
                // ),
                SizedBox(height: 10.h),
                carListTile(
                  context,
                  widget.carDetails.carName!,
                  widget.carDetails.carImage!,
                  widget.carDetails,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomListTile(
                  leading: CustomText(
                    text: AppStrings.details,
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                  trailing: GestureDetector(
                    onTap: () => Get.off(UpdateCar(widget.carDetails)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      color: Colors.red,
                      child: CustomText(
                        text: AppStrings.edit,
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomListTile(
                  leading: CustomText(
                    text: widget.carDetails.carNumber!,
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                  trailing: CustomText(
                    text: widget.carDetails.carModel!,
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 10.h),
                tableHeader(),
                _fuelsTable(),

                SizedBox(height: 10.h),

                SimpleButton(
                  button_label: AppStrings.addFuel,
                  onButtonPressed: () {
                    Get.to(AddFuel(widget.carDetails.id!));
                  },
                  button_color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget tableHeader() => Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      color: Colors.red,
      width: 1.sw,
      height: 20.h,
      child: Row(
        children: [
          Spacer(flex: 1),
          CustomText(
            text: 'Price',
            fontSize: 12.sp,
          ),
          Spacer(flex: 6),
          CustomText(
            text: 'Litres',
            fontSize: 12.sp,
          ),
          Spacer(flex: 7),
          CustomText(
            text: 'Date',
            fontSize: 12.sp,
          ),
          Spacer(flex: 7),
        ],
      ),
    );
