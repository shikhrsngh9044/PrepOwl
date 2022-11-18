import 'package:flutter/material.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/res/dimen.dart';
import '../../login/view/social_screen_ui/socal_sign_up.dart';
import 'otp_view/otp_form.dart';
import 'otp_view/otp_top_image.dart';

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
        padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
        child: Column(
          children: [
            const OTPScreenTopImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [OtpForm()],
            ),
            const SizedBox(height: AppDimen.size50),
            GestureDetector(
              onTap: () {
                // OTP code resend
              },
              child: const Text(
                AppConst.resendOTP,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const SocalLogin()
          ],
        ));
  }
}
