// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:calcugasliter/Auth/login/view/login_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../Core/home/view/home.dart';
import 'package:entry/entry.dart';
import '../widgets/background_image_widget.dart';
import '../widgets/center_logo.dart';

final box = GetStorage();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (box.read('token') != null) {
        Logger().e(box.read('token'));
        Get.off(Home());
      } else {
        Logger().e(box.read('token'));
        Get.off(LoginMethod());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Column(
        children: [
          const Spacer(flex: 5),
          _animatedLogo(),
          const Spacer(flex: 1),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}

Widget _animatedLogo() {
  return Center(
    child: Entry(
      xOffset: -1000,
      scale: 20,
      delay: Duration(milliseconds: 300),
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      child: Entry(
        opacity: .5,
        angle: 3.1415,
        scale: .5,
        delay: Duration(milliseconds: 900),
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
        child: CenterLogo(
          logoWidth: 300.w,
          logoHeight: 300.w,
        ),
      ),
    ),
  );
}
