// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/view/calendar.dart';
import 'package:calcugasliter/Core/fuel/calculate_fuel/view/history.dart';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],        
          theme: ThemeData(fontFamily: "RussoOne"),
          title: 'CalcuGasLitre',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}

// List<GetPage> pagesList = [
//   GetPage(name: Routes.loginRoute, page: () => Login()),
// ];

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
