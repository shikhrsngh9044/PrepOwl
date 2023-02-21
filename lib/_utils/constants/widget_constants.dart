import 'package:flutter/material.dart';

import '../configs/theme_config.dart';
import '../res/dimen.dart';
import 'string_constants.dart';

class WidgetConstants {
  static final WidgetConstants _instance = WidgetConstants._internal();
  WidgetConstants._internal();

  factory WidgetConstants() {
    return _instance;
  }

  static InputDecoration inputDecoration = InputDecoration(
    counterText: '',
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: AppTheme.primaryColorLight),
      borderRadius: BorderRadius.circular(AppDimen.size15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: AppTheme.primaryColorLight),
      borderRadius: BorderRadius.circular(AppDimen.size15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: AppTheme.error),
      borderRadius: BorderRadius.circular(AppDimen.size15),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: AppTheme.error),
      borderRadius: BorderRadius.circular(AppDimen.size15),
    ),
  );
}
