// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/asset_path.dart';
import 'dart:ui';
import '../widgets/custom_text.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription>
    with TickerProviderStateMixin {
  var listItems = [
    Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              fontSize: 20.sp,
              text: 'Purchase',
              color: Colors.white,
            ),
            SizedBox(height: 10.h),
            CustomText(
              fontSize: 20.sp,
              text: '\$0.99',
              color: Colors.white,
            ),
            SizedBox(height: 10.h),
            CustomText(
              fontSize: 10.sp,
              text: AppStrings.lorem,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
    Container(color: Colors.black),
    Container(color: Colors.black),
  ];

  int currentIndex = 0;

  Widget buildGallery3D() {
    return Gallery3D(
        autoLoop: false,
        itemCount: listItems.length,
        width: MediaQuery.of(context).size.width,
        height: 300.h,
        isClip: true,
        // ellipseHeight: 80,
        itemConfig: GalleryItemConfig(
          width: 250.w,
          height: 300.h,
          radius: 10,
          isShowTransformMask: false,
          shadows: [
            //   BoxShadow(
            //     color: Color(0x90000000),
            //     offset: Offset(2, 0),
            //     blurRadius: 5,
            //   )
          ],
        ),
        currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        onClickItem: (index) => print("currentIndex:$index"),
        itemBuilder: (context, index) {
          return listItems[index];
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: AppStrings.subscription),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  // BackgrounBlurView(
                  //   imageUrl: imageUrlList[currentIndex],
                  // ),
                  buildGallery3D(),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.buyNow.toUpperCase(),
                  onButtonPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgrounBlurView extends StatelessWidget {
  final String imageUrl;
  const BackgrounBlurView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.black,
        ),
        // child: Image.asset(
        //   imageUrl,
        //   fit: BoxFit.cover,
        // ),
      ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ))
    ]);
  }
}
