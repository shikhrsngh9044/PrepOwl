// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:permission_handler/permission_handler.dart';

void handleInvalidPermissions(
    PermissionStatus permissionStatus, BuildContext context) {
  if (permissionStatus == PermissionStatus.denied) {
    const snackBar = SnackBar(content: Text('Contact access denied'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
    const snackBar =
        SnackBar(content: Text('Contacts not available on device'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<PermissionStatus> cameraPermission() async {
  final PermissionStatus status = await Permission.camera.request();

  return status;
}

Future<PermissionStatus> galleryPermission() async {
  final PermissionStatus status = await Permission.photos.request();

  return status;
}

Future<PermissionStatus> storagePermission() async {
  final PermissionStatus status = await Permission.storage.request();

  return status;
}
