import 'package:flutter/material.dart';
import 'package:prepowl/_utils/ui_components/bottom_sheet/bottomSheet_ui.dart';

class CustomBottomSheet {
  static getProfilePic(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext mContext) {
          return const BottomSheetScreen();
        });
  }
}
