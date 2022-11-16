import 'package:flutter/material.dart';
import '../../../../_utils/res/dimen.dart';
import '../../../../_utils/configs/theme_config.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../login/view/login_screen.dart';

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
        primary: AppTheme.primaryColorLight,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Login();
            },
          ),
        );
      },
    );
  }
}
