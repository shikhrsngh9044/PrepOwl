import 'package:flutter/material.dart';
import 'package:prepowl/_utils/configs/theme_config.dart';
import '../../../_utils/constants/string_constants.dart';
import 'otp_view/otp_form.dart';
import 'otp_view/otp_top_image.dart';
import '../../../_utils/res/dimen.dart';
import '../../login/view/social_screen_ui/socal_sign_up.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: MobileSignupScreen(),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            AppDimen.size8, AppDimen.size18, AppDimen.size8, AppDimen.size8),
        child: Column(
          children: [
            const OTPScreenTopImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [OtpForm()],
            ),
            const SizedBox(height: AppDimen.size30),
            InkWell(
              onTap: () {
                // OTP code resend
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppConst.resendOTP,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColorLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    child: const Icon(Icons.refresh),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SocalLogin()
          ],
        ));
  }
}
