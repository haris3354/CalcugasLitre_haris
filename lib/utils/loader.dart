import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const SpinKitFadingCircle(
      duration: Duration(milliseconds: 1000),
      color: Colors.red,
      size: 50.0,
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
