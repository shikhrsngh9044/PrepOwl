import 'package:flutter/material.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import 'package:prepowl/_utils/res/dimen.dart';
import '../../../../_utils/constants/string_constants.dart';
import '../../../otpScreen/view/otp_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Center(
            child: TextField(
              cursorColor: AppTheme.primaryColorLight,
              decoration: InputDecoration(
                hintText: AppConst.hintText,
                labelText: AppConst.mobile,
                labelStyle: const TextStyle(color: AppTheme.primaryColorLight),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: AppTheme.primaryColorLight),
                  borderRadius: BorderRadius.circular(AppDimen.size15),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDimen.size60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimen.size40, vertical: AppDimen.size16),
              backgroundColor: AppTheme.primaryColorLight,
              shape: const StadiumBorder(),
            ),
            child: Text(
              AppConst.genrateOTP.toUpperCase(),
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
                    return const OtpScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: AppDimen.size60),
        ],
      ),
    );
  }
}
