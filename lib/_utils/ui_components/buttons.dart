// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import '../configs/theme_config.dart';
import '../constants/enums.dart';

class PrimaryButton extends StatelessWidget {
  final bool isDisabled;
  final bool isProgressing;
  final SIZES size;
  final Size? customSize;
  final TextStyle? customTextStyle;
  final String btnText;
  final double? horizPadding;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final EdgeInsets contentPadding;

  const PrimaryButton({
    Key? key,
    this.size = SIZES.medium,
    this.isDisabled = false,
    this.isProgressing = false,
    required this.btnText,
    required this.onPressed,
    this.horizPadding = 30.0,
    this.buttonColor = AppTheme.secondaryColor,
    this.customSize,
    this.customTextStyle,
    this.contentPadding = const EdgeInsets.all(2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizPadding ?? 20.0),
      child: TextButton(
        onPressed: isDisabled
            ? null
            : isProgressing
                ? () {}
                : onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              padding: contentPadding.wrapMatProp(),
              foregroundColor: isDisabled
                  ? AppTheme.grey2.wrapMatProp()
                  : buttonColor.wrapMatProp(),
              backgroundColor: isDisabled
                  ? AppTheme.grey5.wrapMatProp()
                  : buttonColor.wrapMatProp(),
              minimumSize: customSize != null
                  ? customSize!.wrapMatProp()
                  : size != SIZES.medium
                      ? Size(
                          (size == SIZES.extraSmall
                                  ? 20
                                  : size == SIZES.small
                                      ? 30
                                      : size == SIZES.large
                                          ? 50
                                          : 40)
                              .h,
                          100.h > 1000 && 100.w > 370 ? 5.5.h : 6.h,
                        ).wrapMatProp()
                      : null,
            ),
        child: isProgressing
            ? const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(AppTheme.whiteColor),
                ),
              )
            : Text(
                btnText,
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: customTextStyle != null
                    ? customTextStyle!
                    : (size == SIZES.extraSmall || size == SIZES.small)
                        ? Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: isDisabled
                                  ? AppTheme.grey2
                                  : AppTheme.whiteColor,
                            )
                        : size == SIZES.medium
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: isDisabled
                                      ? AppTheme.grey2
                                      : AppTheme.whiteColor,
                                )
                            : Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: isDisabled
                                      ? AppTheme.grey2
                                      : AppTheme.whiteColor,
                                ),
              ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final bool isProgressing;
  final bool isDisabled;
  final bool tapFill;
  final bool isTextBold;
  final double horizPadding;
  final double borderWidth;
  final SIZES size;
  final Size? customSize;
  final TextStyle? customTextStyle;

  final Color? borderColor;
  final String btnText;
  final VoidCallback onPressed;
  final Color? textColor;
  const SecondaryButton({
    Key? key,
    this.isDisabled = false,
    this.isProgressing = false,
    required this.btnText,
    required this.onPressed,
    this.tapFill = false,
    this.borderWidth = 1,
    this.size = SIZES.medium,
    this.horizPadding = 20.0,
    this.borderColor,
    this.isTextBold = false,
    this.customSize,
    this.customTextStyle,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizPadding),
      child: OutlinedButton(
        onPressed: isDisabled || isProgressing ? null : onPressed,
        style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
              foregroundColor: isDisabled ? AppTheme.grey5.wrapMatProp() : null,
              backgroundColor: isDisabled
                  ? AppTheme.grey5.wrapMatProp()
                  : tapFill
                      ? MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppTheme.secondaryColor_30;
                          }

                          return null;
                        })
                      : AppTheme.grey5.wrapMatProp(),
              minimumSize: customSize != null
                  ? customSize!.wrapMatProp()
                  : size != SIZES.medium
                      ? Size(
                          (size == SIZES.extraSmall
                                  ? 20
                                  : size == SIZES.small
                                      ? 30
                                      : size == SIZES.large
                                          ? 40.0
                                          : 50.0)
                              .h,
                          100.h > 800 && 100.w > 370 ? 5.h : 6.h,
                        ).wrapMatProp()
                      : null,
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  width: borderWidth,
                  color: borderColor ?? AppTheme.secondaryColor_30,
                ),
              ),
            ),
        child: isProgressing
            ? const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(AppTheme.black),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      btnText,
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: customTextStyle != null
                          ? customTextStyle!
                          : (size == SIZES.extraSmall || size == SIZES.small)
                              ? Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: textColor ?? AppTheme.secondaryColor,
                                    fontWeight:
                                        isTextBold ? FontWeight.w500 : null,
                                  )
                              : size == SIZES.medium
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: textColor ??
                                            AppTheme.secondaryColor,
                                        fontWeight:
                                            isTextBold ? FontWeight.w500 : null,
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: textColor ??
                                            AppTheme.secondaryColor,
                                        fontWeight:
                                            isTextBold ? FontWeight.w500 : null,
                                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class SuccessButton extends StatelessWidget {
  final bool isDisabled;
  final bool isProgressing;
  final SIZES size;
  final String btnText;
  // final String iconAsset;
  final Color? iconColor;
  final Color? backgroudColor;
  final VoidCallback? onPressed;
  final Size? iconSize;
  final TextStyle? textStyle;
  const SuccessButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
    this.textStyle,
    this.isProgressing = false,
    this.isDisabled = false,
    // this.iconAsset = Assets.doneIconGreen,
    this.size = SIZES.medium,
    this.iconSize = const Size(20.0, 20.0),
    this.iconColor,
    this.backgroudColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              foregroundColor: isDisabled ? AppTheme.grey2.wrapMatProp() : null,
              backgroundColor: isDisabled
                  ? AppTheme.grey4.wrapMatProp()
                  : (backgroudColor ?? Colors.transparent).wrapMatProp(),
              minimumSize: size != SIZES.medium
                  ? Size(
                      (size == SIZES.extraSmall
                              ? 20
                              : size == SIZES.small
                                  ? 30
                                  : size == SIZES.large
                                      ? 50
                                      : 40)
                          .h,
                      100.h > 800 && 100.w > 370 ? 5.h : 6.h,
                    ).wrapMatProp()
                  : null,
            ),
        child: isProgressing
            ? const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(AppTheme.black),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   iconAsset,
                  //   height: 20.0,
                  //   width: 20.0,
                  //   color: iconColor,
                  // ),
                  // const SizedBox(width: 5.0),
                  Text(
                    btnText,
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: (size == SIZES.extraSmall || size == SIZES.small)
                        ? Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: isDisabled ? AppTheme.grey2 : Colors.black,
                            )
                        : size == SIZES.medium
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: isDisabled
                                      ? AppTheme.grey2
                                      : Colors.black,
                                )
                            : Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: isDisabled
                                      ? AppTheme.grey2
                                      : Colors.black,
                                ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  final bool isDisabled;
  final bool isProgressing;
  final SIZES size;
  final Size? customSize;
  final TextStyle? customTextStyle;
  final String btnText;
  final Widget icon;
  final double? horizPadding;
  final Color? textColor;
  final Color? backgroudColor;
  final VoidCallback? onPressed;
  const ButtonWithIcon({
    Key? key,
    required this.btnText,
    required this.onPressed,
    required this.icon,
    this.isProgressing = false,
    this.isDisabled = false,
    this.size = SIZES.medium,
    this.backgroudColor,
    this.textColor,
    this.horizPadding = 20.0,
    this.customSize,
    this.customTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizPadding ?? 20.0),
      child: TextButton(
        onPressed: isDisabled
            ? null
            : isProgressing
                ? null
                : onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              foregroundColor: isDisabled ? AppTheme.grey2.wrapMatProp() : null,
              backgroundColor: isDisabled
                  ? AppTheme.grey4.wrapMatProp()
                  : (backgroudColor ?? Colors.transparent).wrapMatProp(),
              minimumSize: customSize != null
                  ? customSize!.wrapMatProp()
                  : size != SIZES.medium
                      ? Size(
                          (size == SIZES.extraSmall
                                  ? 20
                                  : size == SIZES.small
                                      ? 30
                                      : size == SIZES.large
                                          ? 40
                                          : 50)
                              .h,
                          100.h > 800 && 100.w > 370 ? 5.h : 6.h,
                        ).wrapMatProp()
                      : null,
            ),
        child: isProgressing
            ? const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(AppTheme.black),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    btnText,
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: customTextStyle != null
                        ? customTextStyle!
                        : (size == SIZES.extraSmall || size == SIZES.small)
                            ? Theme.of(context).textTheme.bodyText2
                            : size == SIZES.medium
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color:
                                          textColor ?? AppTheme.secondaryColor,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color:
                                          textColor ?? AppTheme.secondaryColor,
                                    ),
                  ),
                  icon,
                ],
              ),
      ),
    );
  }
}

class CicrcularButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? radius;
  final double? iconSize;
  final IconData iconAsset;

  const CicrcularButton({
    Key? key,
    required this.onTap,
    this.radius = 10,
    this.iconSize = 17,
    this.iconAsset = Icons.close,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(Icons.cancel_rounded),
    );
  }
}
