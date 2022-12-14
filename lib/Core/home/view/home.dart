// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member
import 'dart:io';
import 'package:calcugasliter/widgets/Exit_Confirmation.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:calcugasliter/Auth/profile/controller/update_profile_controller.dart';
import 'package:calcugasliter/Core/Add_Car/view/add_car.dart';
import 'package:calcugasliter/Core/AllCars/controller/allcars_conroller.dart';
import 'package:calcugasliter/Core/home/widgets/slidable_widget.dart';
import 'package:calcugasliter/Core/update_Car/update_car.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:calcugasliter/widgets/custom_text.dart';
import 'package:calcugasliter/widgets/shimmer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../services/api_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/car_list_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AllCarsController carController = Get.put(AllCarsController());

  Future _dismissSlidableItem(BuildContext context, int index) async {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Do you want to delete ${carController.carList[index].carName}',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          content: Builder(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      final Map<String, dynamic> data = <String, dynamic>{};
                      data['car_id'] = carController.carList[index].id;
                      var response = await ApiService.delete(
                          NetworkStrings.deleteCarEndPoint, data);
                      if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
                        carController.carList.removeAt(index);
                        customSnackBar('Car Deleted');
                      }
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
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
      child: WillPopScope(
        onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => exitConfirmationDialog(context),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: GetBuilder<updateProfileController>(
            init: updateProfileController(),
            builder: (controller) => customDrawer(
                context, controller.name, controller.image, controller.email),
          ),
          appBar: customAppBar(context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.myCars.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 21.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: Obx(
                    () => (carController.isloading.value)
                        ? carController.carList.isNotEmpty
                            ? ListView.separated(
                                physics: BouncingScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 7.h);
                                },
                                itemCount: carController.carList.length,
                                itemBuilder: (context2, index) {
                                  return SlidableWidget(
                                    onEdit: () => Get.to(
                                      UpdateCar(carController.carList[index]),
                                    ),
                                    onDismissed: () =>
                                        _dismissSlidableItem(context, index),
                                    child: carListTile(
                                      context,
                                      carController.carList[index].carName!,
                                      carController.carList[index].carImage!,
                                      carController.carList[index],
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: CustomText(
                                  text: AppStrings.noCarsAdded,
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                ),
                              )
                        : shimmerListView(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: _customFloatingActionButton(context),
        ),
      ),
    );
  }
}

//-------------- Floating Action Button---------

Widget _customFloatingActionButton(BuildContext context) => GestureDetector(
      child: Image.asset(
        AssetPath.add,
        width: 50.w,
        height: 50.h,
      ),
      onTap: () {
        Get.to(AddCar());
      },
    );

shimmerListView() => ListView.separated(
      itemCount: 2,
      itemBuilder: (context2, index) {
        return ShimmerListTile();
        //);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 7.h);
      },
    );
