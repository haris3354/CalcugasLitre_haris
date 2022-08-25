import 'dart:convert';
import 'dart:io';
import 'package:calcugasliter/Auth/login/model/social_login_response.dart';
import 'package:calcugasliter/Auth/profile/controller/update_profile_controller.dart';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import '../../../Core/home/view/home.dart';
import '../controller/login_controller.dart';
import '../../../services/api_service.dart';
import '../../../services/firebase_messaging_service.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/loader.dart';
import '../../../utils/network_strings.dart';
import '../../../widgets/center_logo.dart';
import '../../../screens/splash_screen.dart';

var log = Logger();
final controller = Get.put(updateProfileController());

class SocialLogin extends StatefulWidget {
  SocialLogin({Key? key}) : super(key: key);
  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 120.h),
              CenterLogo(
                logoWidth: 150.w,
                logoHeight: 150.w,
              ),
              SizedBox(height: 30.h),
              CustomButton(
                button_icon: Image.asset(
                  AssetPath.facebook,
                  width: 20.w,
                  height: 20.h,
                ),
                button_label: AppStrings.loginInWithFacebook.toUpperCase(),
                onButtonPressed: () {},
              ),
              SizedBox(height: 7.h),
              CustomButton(
                button_icon: Image.asset(
                  AssetPath.google,
                  width: 20.w,
                  height: 20.h,
                ),
                button_label: AppStrings.loginInWithGoogle.toUpperCase(),
                onButtonPressed: () {
                  _googleSignUp().then(
                    (value) {},
                  );
                },
              ),
              SizedBox(height: 7.h),
              if (Platform.isIOS)
                CustomButton(
                  button_icon: Image.asset(
                    AssetPath.apple,
                    width: 20.w,
                    height: 20.h,
                  ),
                  button_label: AppStrings.loginInWithApple.toUpperCase(),
                  onButtonPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}

_googleSignUp() async {
  ConnectivityManager? _connectivityManager = ConnectivityManager();
  try {
    showLoading();
    if (await _connectivityManager.isInternetConnected()) {
      FirebaseMessagingService firebaseService = FirebaseMessagingService();
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user = (await _auth.signInWithCredential(credential)).user;

      Map<String, dynamic> socialLoginData = {
        "user_social_token": googleUser?.id.toString(),
        "user_social_type": "Google",
        "user_device_type": Platform.isAndroid ? "Android" : 'Ios',
        "user_device_token": await firebaseService.getToken(),
        "user_email": user?.email,
        //   "full_name": user.displayName,
      };
      await _googleSignIn.signOut();
      log.w("Pay-Load : $socialLoginData");
      var response = await ApiService.post(
          NetworkStrings.socialLoginEndpoint, socialLoginData);
      log.i("Response Of API : ${response.body}");
      var dataInJson = jsonDecode(response.body);

      print(response.body);
      print(dataInJson);
      if ((response.statusCode == 200) && (dataInJson['status'] == 1)) {
        stopLoading();
        var obj = SocialLoginResponse.fromJson(dataInJson);
        if (obj.user?.verified == 1) {
          box.write('isSocial', true);
          box.write('token', obj.user?.userAuthentication);
          box.write('verified', obj.user?.verified);
          box.write('name', obj.user?.fullName ?? user?.displayName);
          box.write('email', user?.email);
          if (obj.user?.image != null) {
            box.write('image', obj.user?.image);
          }
          if (obj.user?.image == null) {
            box.write('image',
                "https://cdn-icons-png.flaticon.com/512/147/147144.png");
          }
          controller.setFields(
              obj.user?.fullName, obj.user?.image, user?.email!);
          customSnackBar("Login SucessFully");
          isVerified = true;
          log.w(box.read('token'));
          Get.offAll(const Home());
        } else {}
      } else {
        stopLoading();
        customSnackBar(dataInJson['msg']);
      }
      return user;
    } else {
      stopLoading();
      customSnackBar('No Internet Connection');
    }
  } catch (e) {
    Get.offAll(const Home());
    // customSnackBar(e.toString());
  }
}
