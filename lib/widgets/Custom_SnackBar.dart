import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:get/get_utils/get_utils.dart';

SnackbarController customSnackBar(String message) => Get.snackbar(
      "",
      message,
      duration: 2.seconds,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
