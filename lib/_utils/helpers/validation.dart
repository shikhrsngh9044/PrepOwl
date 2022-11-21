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
}
