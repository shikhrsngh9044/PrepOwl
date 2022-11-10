// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'env_config.dart';

class AppConfig extends InheritedWidget {
  final EnvConfig envConfig;

  const AppConfig({
    Key? key,
    required super.child,
    required this.envConfig,
  }) : super(key: key);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
