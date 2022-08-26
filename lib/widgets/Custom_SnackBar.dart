// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar(String message) => Get.rawSnackbar(
      padding: const EdgeInsets.all(20),
      borderRadius: 50,
      duration: 2.seconds,
      margin: const EdgeInsets.all(15),
      messageText: Center(
          child: Text(
        message,
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      )),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      backgroundColor: Colors.white,
    );
