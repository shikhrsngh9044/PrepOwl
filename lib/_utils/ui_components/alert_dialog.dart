// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../configs/theme_config.dart';

class AlertDialogBoxs<T> extends StatelessWidget {
  final String titleText;
  final String contentText;
  final bool isContentCenterAligned;
  final bool isSubText;
  final String cancelButtonText;
  final String buttonText;

  final bool isCenterImageShow;
  final bool barrierDismissible;
  final bool isShowTitle;
  final bool noBold;
  final bool invertedButtons;

  final VoidCallback? cancelOnPressed;
  final VoidCallback? onPressed;

  const AlertDialogBoxs({
    Key? key,
    required this.buttonText,
    required this.cancelButtonText,
    required this.titleText,
    required this.contentText,
    required this.isCenterImageShow,
    this.cancelOnPressed,
    this.onPressed,
    this.isContentCenterAligned = false,
    this.isShowTitle = true,
    this.noBold = false,
    this.barrierDismissible = false,
    this.isSubText = false,
    this.invertedButtons = false,
  }) : super(key: key);

  Future<T?> alertBoxes({required BuildContext context}) async {
    final title = Text(
      titleText,
      textScaleFactor: 1.0,
      style: AppTheme.iosAlert.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );

    final Widget content = Text(
      contentText,
      textScaleFactor: 1.0,
      textAlign: isContentCenterAligned ? TextAlign.center : TextAlign.start,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
    );

    final Widget subText = Text(
      "Delete Account?",
      textScaleFactor: 1.0,
      style: Theme.of(context).textTheme.caption!.copyWith(
            color: AppTheme.accent2,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationThickness: 3,
          ),
    );

    if (Platform.isIOS) {
      return showCupertinoDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return CupertinoAlertDialog(
            title: isShowTitle ? title : null,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  content,
                  if (isSubText) SizedBox(height: 2.h),
                  if (isSubText)
                    Align(
                      alignment: Alignment.topLeft,
                      child: subText,
                    ),
                ],
              ),
            ),
            actions: invertedButtons
                ? [
                    if (cancelButtonText.isNotEmpty)
                      CupertinoDialogAction(
                        onPressed: () {
                          if (cancelOnPressed != null) {
                            cancelOnPressed!();
                          } else {
                            Navigator.pop(context, false);
                          }
                        },
                        child: Text(
                          cancelButtonText,
                          textScaleFactor: 1.0,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: AppTheme.lightBlue,
                                fontWeight: noBold
                                    ? FontWeight.normal
                                    : FontWeight.w400,
                              ),
                        ),
                      ),
                    CupertinoDialogAction(
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed!();
                        } else {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(1.5),
                        color: Colors.transparent,
                        child: Text(
                          buttonText,
                          textScaleFactor: 1.0,
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: AppTheme.lightBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]
                : [
                    CupertinoDialogAction(
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed!();
                        } else {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Text(
                        buttonText,
                        textScaleFactor: 1.0,
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: AppTheme.lightBlue,
                            ),
                      ),
                    ),
                    if (cancelButtonText.isNotEmpty)
                      CupertinoDialogAction(
                        onPressed: () {
                          if (cancelOnPressed != null) {
                            cancelOnPressed!();
                          } else {
                            Navigator.pop(context, false);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(1.5),
                          color: Colors.transparent,
                          child: Text(
                            cancelButtonText,
                            textScaleFactor: 1.0,
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: AppTheme.lightBlue,
                                  fontWeight: noBold
                                      ? FontWeight.normal
                                      : FontWeight.w700,
                                ),
                          ),
                        ),
                      ),
                  ],
          );
        },
      );
    } else {
      return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            title: isShowTitle ? Center(child: title) : null,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  content,
                  if (isSubText) SizedBox(height: 2.h),
                  if (isSubText)
                    Align(
                      alignment: Alignment.topLeft,
                      child: subText,
                    ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: actions(context),
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }

  List<Widget> actions(context) {
    return invertedButtons
        ? [
            if (cancelButtonText.isNotEmpty)
              GestureDetector(
                onTap: () {
                  if (cancelOnPressed != null) {
                    cancelOnPressed!();
                  } else {
                    Navigator.pop(context, false);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  color: Colors.transparent,
                  child: Text(
                    cancelButtonText,
                    textScaleFactor: 1.0,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: AppTheme.lightBlue,
                          fontWeight:
                              noBold ? FontWeight.normal : FontWeight.w400,
                        ),
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context, true);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(1.5),
                color: Colors.transparent,
                child: Text(
                  buttonText,
                  textScaleFactor: 1.0,
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: AppTheme.lightBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]
        : [
            GestureDetector(
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context, true);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(1.5),
                color: Colors.transparent,
                child: Text(
                  buttonText,
                  textScaleFactor: 1.0,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: AppTheme.lightBlue),
                ),
              ),
            ),
            if (cancelButtonText.isNotEmpty)
              GestureDetector(
                onTap: () {
                  if (cancelOnPressed != null) {
                    cancelOnPressed!();
                  } else {
                    Navigator.pop(context, false);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  color: Colors.transparent,
                  child: Text(
                    cancelButtonText,
                    textScaleFactor: 1.0,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: AppTheme.lightBlue,
                          fontWeight:
                              noBold ? FontWeight.normal : FontWeight.w700,
                        ),
                  ),
                ),
              ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
