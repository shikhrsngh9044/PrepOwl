import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../configs/theme_config.dart';

InputDecoration outlineInputDecoration({
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? bgColor,
  TextStyle? hintStyle,
  String? counterText = " ",
  double borderRadius = 8.0,
  bool isDarkBg = false,
  bool colorFilled = false,
  bool isFilled = false,
  bool hasFocus = false,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 1.0,
      horizontal: 7.0,
    ),
    filled: colorFilled,
    fillColor: bgColor ?? AppTheme.grey5,
    hintStyle: hintStyle ??
        AppTheme.lightTextTheme.subtitle2!.copyWith(color: AppTheme.grey3),
    labelText: labelText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: AppTheme.lightTextTheme.subtitle2!
        .copyWith(color: isDarkBg ? AppTheme.grey3 : AppTheme.grey2),
    errorStyle:
        AppTheme.lightTextTheme.caption!.copyWith(color: AppTheme.errorDark),
    errorMaxLines: 2,
    counterText: counterText,
    hintText: hintText ?? '',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: AppTheme.primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: isDarkBg ? AppTheme.grey3 : AppTheme.grey3),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: isDarkBg
            ? isFilled
                ? AppTheme.accent3
                : AppTheme.grey3
            : isFilled
                ? AppTheme.primaryColor
                : AppTheme.grey3,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: isDarkBg ? AppTheme.accent3 : AppTheme.secondaryColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: isDarkBg ? AppTheme.accent3 : AppTheme.primaryColor,
      ),
    ),
    prefixIconColor: AppTheme.grey5,
    prefixIcon: prefixIcon,
    suffixIcon: Padding(
      padding: const EdgeInsets.all(10.0),
      child: suffixIcon,
    ),
  );
}

extension WidgetExtensionsX on Widget {
  Widget addSymmetricMargin({double? vertical, double? horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical ?? 0.0,
        horizontal: horizontal ?? 0.0,
      ),
      child: this,
    );
  }

  Widget addMargin({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  Widget addPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: this,
    );
  }

  /// Custom Widgets Extensions
  Widget addHeader(
    BuildContext context,
    String header, {
    TextStyle? textStyle,
    Color? headerColor,
    EdgeInsets margin = const EdgeInsets.symmetric(
      vertical: 2.0,
      horizontal: 10.0,
    ),
    bool isHeaderBold = false,
    bool isDarkBg = false,
    bool isProgressing = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: margin,
          child: Text(
            header,
            style: textStyle ??
                Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 13.0,
                      color: isDarkBg
                          ? (headerColor ?? AppTheme.grey3)
                          : (headerColor ?? AppTheme.grey2),
                      fontWeight:
                          isHeaderBold ? FontWeight.w500 : FontWeight.normal,
                    ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (isProgressing)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 22.0,
                  width: 22.0,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
            this,
          ],
        ),
      ],
    );
  }

  SliverToBoxAdapter toSliverBox() => SliverToBoxAdapter(child: this);
}

dynamic showToast(
  String toastMsg, {
  Color? backgroundColor,
  bool longToast = false,
  ToastGravity? gravity,
}) {
  return Fluttertoast.showToast(
    msg: toastMsg,
    toastLength: longToast ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor: backgroundColor ?? AppTheme.grey1,
    timeInSecForIosWeb: longToast ? 5 : 2,
  );
}

extension StringExtension on String {
  void get logIt {
    if (kDebugMode) {
      log("LOG.IT ===> $this");
    }
  }
}

String getMonth(int monthNumber) {
  late String month;
  switch (monthNumber) {
    case 1:
      month = "Jan";
      break;
    case 2:
      month = "Feb";
      break;
    case 3:
      month = "Mar";
      break;
    case 4:
      month = "Apr";
      break;
    case 5:
      month = "May";
      break;
    case 6:
      month = "June";
      break;
    case 7:
      month = "July";
      break;
    case 8:
      month = "Aug";
      break;
    case 9:
      month = "Sept";
      break;
    case 10:
      month = "Oct";
      break;
    case 11:
      month = "Nov";
      break;
    case 12:
      month = "Dec";
      break;
    default:
      month = "Jan";
  }
  return month;
}

String getDisplayDateFormat(DateTime date, {bool withTime = false}) {
  String dateString = "";
  dateString += "${date.day.toString().padLeft(2, "0")} ";
  dateString += "${getMonth(date.month).toUpperCase()}, ";
  dateString += date.year.toString().padLeft(2, "0");
  if (withTime) {
    dateString += ",${date.hour.toString().padLeft(2, '0')} :";

    dateString +=
        "${date.minute.toString().padLeft(2, "0")}  ${date.hour < 12 ? "AM" : "PM"}";
  }
  return dateString;
}
