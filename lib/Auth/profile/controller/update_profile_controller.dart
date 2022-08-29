// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class updateProfileController extends GetxController {
  final GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  var name = box.read('name');
  var image = box.read('image') == null
      ? NetworkStrings.defaultAvatar
      : "${NetworkStrings.imageBaseUrl}${box.read('image')}";
  String? email = box.read('email');
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void setFields(String? setname, String? imagePath, String? setemail) {
    name = setname!;
    image = imagePath == null
        ? NetworkStrings.defaultAvatar
        : "${NetworkStrings.imageBaseUrl}$imagePath";
    email = setemail ?? box.read('email');
    update();
  }
}
