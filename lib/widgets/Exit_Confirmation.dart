import 'dart:io';
import 'package:calcugasliter/utils/app_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget exitConfirmationDialog(BuildContext context) => AlertDialog(
      title: const Text(AppStrings.areYouSureWantToQuit),
      actions: <Widget>[
        TextButton(
          child: const Text(AppStrings.cancel),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: const Text(AppStrings.exit),
          onPressed: () => exit(0),
        ),
      ],
    );
