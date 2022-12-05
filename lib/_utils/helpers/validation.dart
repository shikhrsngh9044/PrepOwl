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
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (text == null || text.isEmpty || !regex.hasMatch(text)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}
