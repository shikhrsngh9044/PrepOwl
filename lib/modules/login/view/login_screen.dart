import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/modules/login/controller/login_bloc.dart';
import 'package:prepowl/modules/login/repo/login_repo.dart';

import 'login_screen_ui/login_top_image.dart';
import 'login_screen_ui/mobile_login_form.dart';
import 'social_screen_ui/socal_sign_up.dart';

class LoginUiScreen extends StatelessWidget {
  const LoginUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: BlocProvider(
        create: (context) => LoginBloc(
          loginRepository: RepositoryProvider.of<LoginRepository>(context),
        ),
        child: const LoginPageScreen(),
      ),
    );
  }
}

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

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
