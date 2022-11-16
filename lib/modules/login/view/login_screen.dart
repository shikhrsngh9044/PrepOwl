import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/dashboard/view/dashboard.dart';

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
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
              ),
            );
          } else if (state.isAuthenticated) {
            return Dashboard(
              name: state.loginDTO?.name,
              email: state.loginDTO?.email,
              uid: state.loginDTO?.uid,
            );
            // Navigator.of(context).pushNamed(RouteNames.dashboard);
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
