import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sizer/sizer.dart';

import '_utils/configs/app_config.dart';
import '_utils/configs/app_state.dart';
import '_utils/configs/env_config.dart';
import '_utils/configs/theme_config.dart';
import '_utils/constants/app_constants.dart';
import '_utils/constants/routes.dart';
import '_utils/services/network_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late InernetConnectivityService _connectivityService;

  @override
  void initState() {
    _connectivityService = InernetConnectivityService.init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bool lastValue = true;
    _connectivityService.connectivityStatus.listen((event) {
      if (mainNavigatorKey.currentContext != null) {
        if (lastValue != event) {
          lastValue = event;
          if (event) {
            Flushbar(
              messageText: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.check_rounded,
                    color: AppTheme.accent1,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Connected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppTheme.grey1,
                    ),
                  ),
                ],
              ),
              messageColor: AppTheme.grey1,
              flushbarPosition: FlushbarPosition.BOTTOM,
              backgroundColor: AppTheme.secondaryColor.withOpacity(0.08),
              positionOffset: 60.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
              flushbarStyle: FlushbarStyle.FLOATING,
              duration: const Duration(seconds: 2),
            ).show(mainNavigatorKey.currentContext!);
          } else {
            Flushbar(
              messageText: const Text(
                "Trying to connect",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppTheme.grey1,
                ),
              ),
              messageColor: AppTheme.grey1,
              flushbarPosition: FlushbarPosition.BOTTOM,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.06),
              positionOffset: 60.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
              flushbarStyle: FlushbarStyle.FLOATING,
              duration: const Duration(seconds: 2),
            ).show(mainNavigatorKey.currentContext!);
          }
        }
      }
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box('core').listenable(keys: ['theme', 'token', 'current_user']),
      builder: (context, Box coreBox, widget) {
        final themeValue = coreBox.get('theme', defaultValue: 'light');
        final currentUser =
            coreBox.get('current_user', defaultValue: {}) as Map;

        token = coreBox.get('token', defaultValue: '') as String;

        final authenticated = token.isNotEmpty && currentUser.isEmpty;

        return Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return GetMaterialApp(
              navigatorKey: mainNavigatorKey,
              supportedLocales: const [Locale("en", "IN")],
              debugShowCheckedModeBanner: false,
              title: AppConfig.of(context)!.envConfig.appTitle,
              theme: appThemeData[themeValue ?? 'light'],
              builder: (context, child) => child!,
              navigatorObservers: [SentryNavigatorObserver()],
              getPages: authenticated ? authorizedPages : publicPages,
              initialRoute:
                  authenticated ? RouteNames.homePage : RouteNames.signupPage,
            );
          },
        );
      },
    );
  }
}

Future appInitializer(EnvConfig envConfig) async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.initFlutter();
  // Hive.registerAdapter(UserEntityAdapter());

  final coreBox = await Hive.openBox('core');
  coreBox.put('firstLogin', true);
  token = coreBox.get('token', defaultValue: '') as String;

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
    platformOSVersion = androidInfo.version.release;
  }

  if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor!;
    platformOSVersion = iosInfo.systemVersion!;
  }

  final AppConfig configuredApp = AppConfig(
    envConfig: envConfig,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      builder: (context, _) => const MyApp(),
    ),
  );

  return runApp(configuredApp);
}
