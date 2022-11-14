// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import '../constants/string_constants.dart';
import 'alert_dialog.dart';

class DefaultAlerts {
  static Future<void> showAppSettingsAlert(
    BuildContext context,
    String messsage,
  ) async {
    await AlertDialogBoxs(
      buttonText: "Settings",
      cancelButtonText: "Cancel",
      titleText: "Need Permission",
      isShowTitle: false,
      contentText: messsage,
      cancelOnPressed: () {
        Navigator.pop(context);
      },
      onPressed: () async {
        await openAppSettings();
      },
      isCenterImageShow: false,
    ).alertBoxes(context: context);
  }

  static Future<bool> showCloseAlertDialog(
    BuildContext context, {
    String? action,
  }) async {
    final result = await const AlertDialogBoxs<bool>(
      buttonText: AlertMassages.yes,
      cancelButtonText: AlertMassages.no,
      titleText: AlertMassages.areYouSure,
      contentText: AlertMassages.porgressWillLost,
      isCenterImageShow: false,
    ).alertBoxes(context: context);

    return result ?? false;
  }

  static Future<bool> onWillPopsAction(BuildContext context) async {
    final result = await AlertDialogBoxs<bool>(
      buttonText: AlertMassages.yes,
      cancelButtonText: AlertMassages.no,
      titleText: AlertMassages.exitApp,
      contentText: AlertMassages.sureWantToExitApp,
      isCenterImageShow: false,
      onPressed: () {
        exit(0);
      },
      cancelOnPressed: () {
        Navigator.pop(context);
      },
    ).alertBoxes(context: context);

    return result ?? false;
  }
}
