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

    if (email.trim().isEmpty) {
      return AppConst.emailEmpty;
    }

    return null;
  }
}
