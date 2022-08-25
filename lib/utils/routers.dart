// // // ignore_for_file: prefer_const_constructors
// // ignore_for_file: prefer_const_constructors

// import 'package:calcugasliter/screens/10)carDetails.dart';
// import 'package:calcugasliter/screens/11)add_fuel.dart';
// import 'package:calcugasliter/screens/17)update_password.dart';
// import 'package:calcugasliter/screens/18)terms_and_conditions.dart';
// import 'package:calcugasliter/screens/19)privacy_policy.dart';
// import 'package:calcugasliter/screens/20)add_car.dart';
// import 'package:calcugasliter/screens/21)edit_profile.dart';
// import 'package:calcugasliter/Auth/signup/view/4)signup.dart';
// import 'package:calcugasliter/screens/5)forgot_password.dart';
// import 'package:calcugasliter/screens/6)otp_verification.dart';
// import 'package:calcugasliter/utils/routes.dart';
// import 'package:flutter/material.dart';
// import '../screens/1)splash_screen.dart';
// import '../screens/12)calendar.dart';
// import '../screens/13)stats.dart';
// import '../screens/14)history.dart';
// import '../screens/15)settings.dart';
// import '../screens/16)subscription.dart';
// import '../screens/2)login_method.dart';

// import '../screens/7)reset_password.dart';
// import '../screens/8)social_login.dart';
// import '../screens/9)home.dart';

// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.homeRoute:
//         return MaterialPageRoute(builder: (_) => SplashScreen());
//       case Routes.loginMethodsRoute:
//         return MaterialPageRoute(builder: (_) => LoginMethod());
//       case Routes.signupRoute:
//         return MaterialPageRoute(builder: (_) => Signup());
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => ForgotPassword());
//       case Routes.otpVerificationRoute:
//         return MaterialPageRoute(builder: (_) => OtpVerification());
//       case Routes.resetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => ResetPassword());
//       case Routes.socialLoginRoute:
//         return MaterialPageRoute(builder: (_) => SocialLogin());
//       case Routes.homeScreenRoute:
//         return MaterialPageRoute(builder: (_) => Home());
//       case Routes.addFuel:
//         return MaterialPageRoute(builder: (_) => AddFuel());
//       case Routes.calendar:
//         return MaterialPageRoute(builder: (_) => Calendar());
//       case Routes.stats:
//         return MaterialPageRoute(builder: (_) => Stats());
//       case Routes.history:
//         return MaterialPageRoute(builder: (_) => History());
//       case Routes.settings:
//         return MaterialPageRoute(builder: (_) => Settings());
//       case Routes.carDetails:
//         return MaterialPageRoute(builder: (_) => CarDetails());
//       case Routes.termsAndConditions:
//         return MaterialPageRoute(builder: (_) => TermsAndCondition());
//       case Routes.privacyPolicy:
//         return MaterialPageRoute(builder: (_) => PrivacyPolicy());
//       case Routes.updatePassword:
//         return MaterialPageRoute(builder: (_) => UpdatePassword());
//       case Routes.addCar:
//         return MaterialPageRoute(builder: (_) => AddCar());
//       case Routes.editProfile:
//         return MaterialPageRoute(builder: (_) => EditProfile());
//       case Routes.subscription:
//         return MaterialPageRoute(builder: (_) => Subscription(title: ''));
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }


// // case Routes.preLoginRoute:
//       //   return MaterialPageRoute(builder: (_) => PreLoginScreen());
//       // case Routes.loginRoute:
//       //   return MaterialPageRoute(builder: (_) => LoginScreen());
//       // case Routes.otpVerificationRoute:
//       //   final args = settings.arguments as Map;
//       //   return MaterialPageRoute(
//       //       builder: (_) => OtpVerificationScreen(
//       //             code: args['v1'],
//       //             userID: args['v2'],
//       //           ));
//       // case Routes.resetPasswordRoute:
//       //   final args = settings.arguments as Map;
//       //   return MaterialPageRoute(
//       //       builder: (_) => ResetPasswordScreen(
//       //             userID: args['v1'],
//       //           ));
//       // case Routes.signupRoute:
//       //   return MaterialPageRoute(builder: (_) => SignUpScreen());
//       // case Routes.forgetPasswordRoute:
//       //   return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
//       // case Routes.selectionRoute:
//       //   return MaterialPageRoute(builder: (_) => SelectionScreen());
//       // case Routes.settingsRoute:
//       //   return MaterialPageRoute(builder: (_) => SettingsScreen());
//       // case Routes.detailsRoute:
//       //   return MaterialPageRoute(builder: (_) => DetailsScreen());