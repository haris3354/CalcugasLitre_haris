import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(
      duration: Duration(milliseconds: 1000),
      color: Colors.white,
      size: 50.0,
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    Alignment.bottomRight;
    return const LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
