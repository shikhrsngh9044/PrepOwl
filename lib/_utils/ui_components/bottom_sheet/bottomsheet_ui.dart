// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/_utils/helpers/global.dart';
import 'package:prepowl/_utils/services/permissions.dart';
import 'package:prepowl/_utils/ui_components/default_alerts.dart';
import 'package:prepowl/_utils/ui_components/widget_extensions.dart';

// Project imports:

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  static Future<File?> showSelectImageBottomSheet(BuildContext context) async {
    final file = await showModalBottomSheet<File>(
      barrierColor: AppTheme.primaryColor_100.withOpacity(0.8),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton.icon(
                    onPressed: () async => await btnCameraAction(context),
                    icon: const Icon(
                      Icons.camera_alt,
                      color: AppTheme.whiteColor,
                    ),
                    label: const Text(
                      "Camera",
                      textScaleFactor: 1.0,
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton.icon(
                    onPressed: () async => await btnGalleryAction(context),
                    icon: const Icon(Icons.camera, color: AppTheme.whiteColor),
                    label: const Text(
                      "Gallery",
                      textScaleFactor: 1.0,
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  static Future<void> btnCameraAction(BuildContext context) async {
    final status = await Permission.camera.status;

    if (status == PermissionStatus.granted ||
        status == PermissionStatus.denied) {
      final isPermissionStatusGranted = await cameraPermission();
      if (isPermissionStatusGranted == PermissionStatus.granted) {
        final image = await chooseImage(source: ImageSource.camera);

        if (image != null) {
          Navigator.pop(context, File(image.path));
        }
      } else if (isPermissionStatusGranted ==
          PermissionStatus.permanentlyDenied) {
        DefaultAlerts.showAppSettingsAlert(
          context,
          AlertMassages.permissionCameraDenied,
        );
      }
    } else {
      DefaultAlerts.showAppSettingsAlert(
        context,
        AlertMassages.permissionCameraDenied,
      );
    }
  }

  static Future<void> btnGalleryAction(BuildContext context) async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.denied) {
        final isPermissionStatusGranted = await storagePermission();
        if (isPermissionStatusGranted == PermissionStatus.granted) {
          final image = await chooseImage(source: ImageSource.gallery);

          final mimeType = lookupMimeType(image!.path);
          if (mimeType != "image/gif") {
            Navigator.pop(context, File(image.path));
          } else {
            showToast("Please add proper image");
          }
        } else if (isPermissionStatusGranted ==
            PermissionStatus.permanentlyDenied) {
          DefaultAlerts.showAppSettingsAlert(
            context,
            AlertMassages.permissionGalleryDenied,
          );
        }
      } else {
        DefaultAlerts.showAppSettingsAlert(
          context,
          AlertMassages.permissionGalleryDenied,
        );
      }
    } else {
      final status = await Permission.photos.status;
      if (status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      } else {
        try {
          final image = await chooseImage(source: ImageSource.gallery);

          if (image != null) {
            Navigator.pop(context, File(image.path));
          }
        } catch (err) {
          DefaultAlerts.showAppSettingsAlert(
            context,
            AlertMassages.permissionGalleryDenied,
          );
        }
      }
    }
  }

  static Future<XFile?> chooseImage({required ImageSource source}) async {
    try {
      final imgPicker = ImagePicker();

      final image = await imgPicker.pickImage(
        source: source,
        imageQuality: 50,
      );

      return image;
    } catch (ex) {
      "ImagePicker Error: $ex";
      printDebug(ex);
      return null;
    }
  }
}
