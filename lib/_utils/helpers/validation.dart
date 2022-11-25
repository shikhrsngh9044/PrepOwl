// ignore_for_file: unnecessary_string_escapes

import '../constants/string_constants.dart';

class Validation {
  static String? phoneNumberValidation(String? text) {
    String phoneNumber = text ?? '';
    if (phoneNumber.trim().isEmpty) {
      return AppConst.emptyMobileNumber;
    } else if (phoneNumber.trim().length < 10) {
      return AppConst.mobileNumberCount;
    }
    return null;
  }

  static String? nameValidation(String? text) {
    String name = text ?? '';

    if (name.trim().isEmpty) {
      return AppConst.nameEmpty;
    } else if (name.trim().length < 2) {
      return AppConst.nameLength;
    }

    return null;
  }

  static String? emailValidation(String? text) {
    String email = text ?? '';
    String pattern =
        "\ /^(?=[^@]*[A-Za-z])([a-zA-Z0-9])(([a-zA-Z0-9])*([\.-_-+])?([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(.))+([a-zA-Z]{2,3})+/i;";
    RegExp regex = RegExp(pattern);

    if (email.trim().isEmpty) {
      return AppConst.emailEmpty;
    } else if (!regex.hasMatch(email)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}
