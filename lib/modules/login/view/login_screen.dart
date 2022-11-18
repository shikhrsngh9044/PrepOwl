import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../_utils/constants/routes.dart';
import '../controller/login_bloc.dart';
import 'login_screen_ui/login_top_image.dart';
import 'login_screen_ui/mobile_login_form.dart';
import 'social_screen_ui/socal_sign_up.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginPageScreen(),
    );
  }
}

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

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

            Get.offAndToNamed(
              RouteNames.dashboard,
              arguments: data,
            );
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
            return const SingleChildScrollView(
              child: MobileSignupScreen(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const LoginScreenTopImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            const Spacer(),
          ],
        ),
        const SocalLogin()
      ],
    );
  }
}
