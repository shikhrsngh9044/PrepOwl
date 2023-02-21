import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../_utils/constants/routes.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/auth_bloc.dart';
import 'social_screen_ui/socal_sign_up.dart';
import 'widgets/login_top_image.dart';
import 'widgets/otp_top_image.dart';
import 'widgets/otp_ui.dart';
import 'widgets/phone_number_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const LoginPageUI(),
    );
  }
}

class LoginPageUI extends StatelessWidget {
  const LoginPageUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            if (state.isNewUser) {
              Get.offAndToNamed(
                RouteNames.register,
              );
            } else {
              Get.offAndToNamed(
                RouteNames.homePage,
              );
            }
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (state.isOtpGenerated)
                const OTPHeader()
              else
                const PhoneHeader(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: state.isOtpGenerated
                      ? const OtpUI()
                      : const PhoneNumberUI(),
                ),
              ),
              const SocalLogin()
            ],
          );
        },
      ),
    );
  }
}
