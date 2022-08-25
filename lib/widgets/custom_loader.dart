import 'package:flutter/material.dart';

Widget loader(bool isLoading) {
  return Visibility(
    visible: isLoading,
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    ),
  );
}
