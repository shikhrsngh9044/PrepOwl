// Flutter imports:
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

final appThemeData = {
  'light': AppTheme.lightTheme,
  'dark': AppTheme.darkTheme,
};

class AppTheme {
  AppTheme._();

  static const primaryColor = Color(0xFFFF4321);
  static const primaryColor_100 = Color(0xFFFF6F59);
  static const primaryColor_80 = Color(0xFFFF9382);
  static const primaryColor_60 = Color(0xFFFFA99B);
  static const primaryColor_40 = Color(0xFFFFA99B);
  static const primaryColor_20 = Color(0xFFFFD8D2);
  static const primaryColor_10 = Color(0xFFFFECE9);
  static const overlayColor = Color(0xFFFF7B5F);

  static const secondaryColor = Color(0xFF203066);
  static const secondaryColor_80 = Color(0xFF203066);
  static const secondaryColor_60 = Color(0xFF203066);
  static const secondaryColor_40 = Color(0xFF949BB5);
  static const secondaryColor_30 = Color(0xFFD9DFE9);
  static const secondaryColor_20 = Color(0xFFE9EBF0);
  static const secondaryColor_10 = Color(0xFFF4F5F7);
  static const secondaryColor_5 = Color(0xFFFBFBFC);
  static const secondaryColor_grey = Color(0xFF717A9D);

  static const primaryColorLight = Color(0xFF36298B);
  static const primaryColorDark = Color(0xFF21027A);
  static const bottomSheetFont = Color(0xFF202A3F);
  static const scrollColor = Color.fromARGB(255, 201, 202, 204);

  static const accent1 = Color(0xFF4CAA3D);
  static const accent2 = Color(0xFF4B58BD);
  static const accent3 = Color(0xFF714170);
  static const accent4 = Color(0xFF003F63);
  static const accent5 = Color(0xFF0095A5);
  static const accent6 = Color(0xFFC15DBF);

  static const grey1 = Color(0xFF464646);
  static const grey2 = Color(0xFF909090);
  static const grey3 = Color(0xFFE4E4E4);
  static const grey4 = Color(0xFFF1F1F1);
  static const grey5 = Color(0xFFF9F9F9);
  static const darkGrey = Color(0xFF181818);

  static const black = Color(0xFF001A28);
  static const bgColor = Color(0xFFFFFFFF);
  static const gradientColor = Color(0xFF36298B);
  static const inActiveTabColor = Color(0xFFFFD0C7);

  static const trustBadgeColor = Color(0xFF5DA9C1);
  static const pioneerBadgeColor = Color(0xFF7D5DC1);
  static const helperBadgeColor = Color(0xFF5DC1B5);

  static const indGradient = [
    Color(0xFFFF4321),
    Color(0xFFFFFFFF),
  ];
  static const grpGradient = [
    Color(0xFF203066),
    AppTheme.secondaryColor_40,
  ];
  static const whiteColor = Color(0xFFFFFFFF);
  static const textFieldColor = Color(0xFFF2F4F7);

  static const buttonColorDark = Color(0xff17BBA6);
  static const buttonColorLight = Color(0xff3ECDBB);

  static const lightBlue = Color(0xff007AFF);

  static const error = Color(0xffE63C1E);

  static const errorDark = Color(0xFFF97A64);

  static const keyboardColor = Color(0xff2E2E2E);

  static const fabPanel = Color(0xffFEBCBC);
  static const fontColor = Color(0xff121212);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    typography: Typography.material2021(colorScheme: const ColorScheme.light()),
    textTheme: lightTextTheme,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    primaryColorDark: primaryColorDark,
    colorScheme: const ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: black,
      background: grey5,
      error: error,
      onPrimary: primaryColor,
      onSecondary: secondaryColor,
      onSurface: black,
      onBackground: grey5,
      onError: error,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const Size(250.0, 50.0).wrapMatProp(),
        padding: EdgeInsets.symmetric(
          vertical: 1.5.h,
          horizontal: 20.w,
        ).wrapMatProp(),
        backgroundColor:
            primaryColorLight.wrapMatButtonColor(disabledColor: grey3),
        foregroundColor: whiteColor.wrapMatButtonColor(disabledColor: black),
        shape: const StadiumBorder().wrapMatProp(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: const Size(250.0, 50.0).wrapMatProp(),
        padding: const EdgeInsets.only(
          top: 6.0,
          bottom: 9.0,
          left: 20.0,
          right: 20.0,
        ).wrapMatProp(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0))
            .wrapMatProp(),
        foregroundColor: black.wrapMatButtonColor(
          disabledColor: AppTheme.grey1,
        ),
        backgroundColor: primaryColorLight.wrapMatButtonColor(
          disabledColor: AppTheme.grey1,
        ),
        overlayColor: Colors.black12.wrapMatProp(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const Size(250.0, 50.0).wrapMatProp(),
        padding: const EdgeInsets.only(
          top: 6.0,
          bottom: 9.0,
          left: 20.0,
          right: 20.0,
        ).wrapMatProp(),
        side: const BorderSide(
          color: secondaryColor,
          width: 1.5,
        ).wrapMatProp(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ).wrapMatProp(),
        foregroundColor: black.wrapMatProp(),
        backgroundColor: Colors.transparent.wrapMatProp(),
        overlayColor: secondaryColor.withOpacity(0.1).wrapMatProp(),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    typography: Typography.material2021(colorScheme: const ColorScheme.dark()),
    textTheme: darkTextTheme,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    primaryColorDark: primaryColorDark,
    colorScheme: const ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: black,
      background: grey5,
      error: error,
      onPrimary: primaryColor,
      onSecondary: secondaryColor,
      onSurface: black,
      onBackground: grey5,
      onError: error,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: secondaryColor.wrapMatProp(),
        backgroundColor: secondaryColor.wrapMatProp(),
      ),
    ),
  );

  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
  );

  static const TextStyle _displayLarge = TextStyle(
    color: black,
    fontSize: 57.0,
    // height: 64.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _displayMedium = TextStyle(
    color: black,
    fontSize: 45.0,
    // height: 53.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _displaySmall = TextStyle(
    color: black,
    fontSize: 36.0,
    // height: 44.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _headlineLarge = TextStyle(
    color: black,
    fontSize: 32.0,
    // height: 40.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _headlineMedium = TextStyle(
    color: black,
    fontSize: 28.0,
    // height: 36.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _headlineSmall = TextStyle(
    color: black,
    fontSize: 24.0,
    // height: 32.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _titleLarge = TextStyle(
    color: black,
    // height: 28.0,
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _titleMedium = TextStyle(
    color: black,
    // height: 24.0,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _titleSmall = TextStyle(
    color: black,
    // height: 20.0,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _labelLarge = TextStyle(
    color: black,
    // height: 20.0,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _labelMedium = TextStyle(
    color: black,
    // height: 16.0,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _labelSmall = TextStyle(
    color: black,
    // height: 16.0,
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _bodyLarge = TextStyle(
    color: black,
    // height: 24.sp,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _bodyMedium = TextStyle(
    color: black,
    // height: 20.0,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _bodySmall = TextStyle(
    color: black,
    // height: 16.0,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _buttonText = _bodyMedium;

  static const TextStyle iosAlert = TextStyle(
    color: black,
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
}

extension MaterialPropX<T> on T {
  MaterialStateProperty<T> wrapMatProp() =>
      MaterialStateProperty.resolveWith<T>((states) => this);
}

extension MaterialColorPropX<Color> on Color {
  MaterialStateProperty<Color> wrapMatButtonColor(
          {required Color disabledColor}) =>
      MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledColor;
          } else {
            return this;
          }
        },
      );
}

extension TextStyleX on TextStyle {
  TextStyle nunito() {
    return copyWith(fontFamily: "Nunito");
  }

  TextStyle comfortaa() {
    return copyWith(fontFamily: "Comfortaa");
  }

  TextStyle quickSand() {
    return copyWith(fontFamily: "Quicksand");
  }
}

final nameInputDecoration = InputDecoration(
    prefixIcon: prefixIconName(),
    border: outlineInputBorder(),
    focusedBorder: outlineFocusInputBorder(),
    enabledBorder: outlineEnableInputBorder(),
    errorBorder: focusedErrorBorder(),
    focusedErrorBorder: focusedErrorBorder());

final emailInputDecoration = InputDecoration(
    prefixIcon: prefixIconEmail(),
    border: outlineInputBorder(),
    focusedBorder: outlineFocusInputBorder(),
    enabledBorder: outlineEnableInputBorder(),
    errorBorder: focusedErrorBorder(),
    focusedErrorBorder: focusedErrorBorder());

final otpInputDecoration = InputDecoration(
  border: outlineInputBorder(),
  focusedBorder: outlineFocusInputBorder(),
  enabledBorder: outlineEnableInputBorder(),
);

Icon prefixIconName() {
  return const Icon(
    Icons.person,
    color: AppTheme.primaryColorLight,
  );
}

Icon prefixIconEmail() {
  return const Icon(
    Icons.email,
    color: AppTheme.primaryColorLight,
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: AppTheme.primaryColorLight),
  );
}

OutlineInputBorder outlineEnableInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppTheme.primaryColorLight,
      width: 2.0,
    ),
  );
}

OutlineInputBorder outlineFocusInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: AppTheme.primaryColorLight,
    ),
  );
}

OutlineInputBorder focusedErrorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(width: 3, color: AppTheme.primaryColorLight),
    borderRadius: BorderRadius.circular(15),
  );
}
