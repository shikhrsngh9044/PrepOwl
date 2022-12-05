import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/routes.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../../_utils/res/dimen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.size10, vertical: AppDimen.size15),
        backgroundColor: AppTheme.primaryColorLight,
        shape: const StadiumBorder(),
      ),
      child: Text(
        AppConst.login.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: AppDimen.size16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Get.offAndToNamed(RouteNames.loginPage);
      },
    );
  }
}
