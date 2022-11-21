import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/login/controller/login_bloc.dart';
import 'package:prepowl/modules/login/repo/login_repo.dart';
import '../../../_utils/constants/string_constants.dart';
import 'otp_view/otp_form.dart';
import 'otp_view/otp_top_image.dart';
import '../../../_utils/res/dimen.dart';
import '../../login/view/social_screen_ui/socal_sign_up.dart';

// ignore: must_be_immutable
class OtpUIScreen extends StatelessWidget {
  OtpUIScreen({
    super.key,
    required this.phoneNumberController,
  });

  TextEditingController phoneNumberController;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: BlocProvider(
        create: (context) => LoginBloc(
          loginRepository: RepositoryProvider.of<LoginRepository>(context),
        ),
        child: OtpScreen(phoneController: phoneNumberController),
      ),
    );
  }
}

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.phoneController}) : super(key: key);

  TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MobileSignupScreen(numberController: phoneController),
      ),
    );
  }
}

// ignore: must_be_immutable
class MobileSignupScreen extends StatelessWidget {
  MobileSignupScreen({
    Key? key,
    required this.numberController,
  }) : super(key: key);
  TextEditingController numberController;

  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    context.read<LoginBloc>().add(SendOtpToPhoneEvent(
          phoneNumber: phoneNumber,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
        child: Column(
          children: [
            OTPScreenTopImage(phoneNumberController: numberController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [OtpForm()],
            ),
            const SizedBox(height: AppDimen.size50),
            GestureDetector(
              onTap: () {
                // OTP code resend
                _sendOtp(phoneNumber: numberController.text, context: context);
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
