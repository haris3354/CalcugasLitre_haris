import 'package:get/get.dart';

class FieldValidator {
//------------- Name Validator--------------//

  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

//------------------ Email Validator ---------------//

  static String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }
//---------------- Password Validator -----------------//

  static String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

//--------------------Confirm Password Validator--------//

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Confirm Password';
    } else if (!(password == confirmPassword)) {
      return 'Password Not Match';
    } else {
      return null;
    }
  }


//---------------- OTP Validator ---------------


static String? validateOtp(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }


static String? validateEmpty(String value) {
    if (value=='') {
      return "Field can't be empty";
    }
    return null;
  }

}
