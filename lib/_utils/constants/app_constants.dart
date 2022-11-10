import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../configs/app_state.dart';
import '../configs/env_config.dart';

bool isConnected = true;

String token = "";
late AppState appState;
EnvConfig envConfig = development;
late PackageInfo packageInfo;
String deviceId = "";
String platformOSVersion = "";
final mainNavigatorKey = GlobalKey<NavigatorState>();
