// ignore_for_file: constant_identifier_names

class NetworkStrings {
  //------------------------- Base URLS ------------------------------------

  static const String apiBaseUrl = "http://server.appsstaging.com:3017/api/";
  static const String imageBaseUrl = "http://server.appsstaging.com:3017/";

//-------------------------------- AUTH-----------------------------------
  static const String signupEndpoint = "signup";
  static const String loginEndpoint = "login";
  static const String forgotPasswordEndpoint = "forgotPassword";
  static const String verifyOtpEndpoint = "verifyOtp";
  static const String changePasswordEndpoint = "changePassword";
  static const String resendCodeEndpoint = "resendCode";
  static const String socialLoginEndpoint = "socialLogin";
  static const String logoutEndPoint = "logout";
  static const String updatePasswordEndPoint = "updatePassword";
  static const String getUserEndPoint = "getprofile";
  static const String updateProfileEndPoint = "updateprofile";

  //---------------- Cars------------------------//
  static const String allCars = "allCars";
  static const String deleteCarEndPoint = "deleteCar";

//----------------  Fuel------------------------//
  static const String addFuelEndPoint = "addFuel";
  static const String getFuelEndPoint = "getFuel/";
  static const String calculateFuelEndPoint = "calFuel";

//-----------------  Stats --------------------//
  static const String getByMonth = "getByMonth";

//------------------- History-------------------//
  static const String history = "getHistory";

//------------------ User Guidelines----------------
  static const String privacyPolicy = "get-content/privacy_policy";
  static const String termsAndConditions = "get-content/terms_and_conditions";

//----------API STATUS CODE-----------------//

  static const int SUCCESS_CODE = 200;
  static const int SUCCESS_CREATED_CODE = 201;

  static const int UNAUTHORIZED_CODE = 401;

  //---------- API MESSAGES ------------------//

  // static const int API_SUCCESS_STATUS = 1;
  // static const int EMAIL_UNVERIFIED = 0;
  // static const int EMAIL_VERIFIED = 1;
  // static const int PROFILE_INCOMPLETED = 0;
  // static const int PROFILE_COMPLETED = 1;
}
