import 'package:flutter/material.dart';
import 'view/welcomeScrenUI/background.dart';
import 'view/welcomeScrenUI/welcome_login_button.dart';

import 'view/welcomeScrenUI/welcome_text_image.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
    ));
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const WelcomeTextImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 5,
              child: LoginButton(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
