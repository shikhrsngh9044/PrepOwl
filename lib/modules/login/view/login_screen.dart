import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../_utils/constants/routes.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/login_bloc.dart';
import 'login_screen_ui/login_top_image.dart';
import 'login_screen_ui/mobile_login_form.dart';
import 'otp_screen_ui/otp_form.dart';
import 'otp_screen_ui/otp_top_image.dart';
import 'social_screen_ui/socal_sign_up.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginPageScreen(),
    );
  }
}

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            var data = {
              'name': state.userDTO?.name,
              'email': state.userDTO?.email,
              'uid': state.userDTO?.uid,
              'photoUrl': state.userDTO?.photoUrl,
            };
            context.read<LoginBloc>().add(UpdateUserStatus(state.userDTO?.uid));
            if (state.isNewUser) {
              Get.offAndToNamed(
                RouteNames.register,
                arguments: data,
              );
            } else {
              Get.offAndToNamed(
                RouteNames.onboarding,
                arguments: data,
              );
            }
          } else if (state.isUnauthenticated) {
            Get.offAndToNamed(
              RouteNames.loginPage,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: MobileSignupScreen(state: state),
            );
          }
        },
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        state.isOtpGenerated
            ? const OTPScreenTopImage()
            : const LoginScreenTopImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: AppDimen.size30,
            ),
            Expanded(
              flex: 8,
              child: state.isOtpGenerated ? OtpForm(state: state) : LoginForm(),
            ),
            const SizedBox(
              width: AppDimen.size30,
            ),
          ],
        ),
        // const SizedBox(
        //   height: AppDimen.size30,
        // ),
        // state.isOtpGenerated
        //     ? AlreadyHaveAnAccountCheck(
        //         press: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) {
        //                 return const CompleteProfileScreen();
        //               },
        //             ),
        //           );
        //         },
        //       )
        //     :
        const SocalLogin()
      ],
    );
  }
}
