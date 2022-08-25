// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:calcugasliter/Auth/profile/controller/update_profile_controller.dart';
import 'package:calcugasliter/Core/Add_Car/view/add_car.dart';
import 'package:calcugasliter/Core/AllCars/controller/allcars_conroller.dart';
import 'package:calcugasliter/Core/home/widgets/slidable_widget.dart';
import 'package:calcugasliter/Core/update_Car/update_car.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/shimmer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_id'] = carController.carList[index].id;
    var response =
        await ApiService.delete(NetworkStrings.deleteCarEndPoint, data);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      carController.carList.removeAt(index);
      // carController.carList.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller1 = Get.put(updateProfileController());
    //  final carController = Get.put(AllCarsController());
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
        drawer: GetBuilder<updateProfileController>(
          builder: (controller) => customDrawer(
              context, controller1.name, controller1.image, controller1.email),
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
                      ? ListView.separated(
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
                      : shimmerListView(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _customFloatingActionButton(context),
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
      itemCount: 4,
      itemBuilder: (context2, index) {
        return ShimmerListTile();
        //);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 7.h);
      },
    );
