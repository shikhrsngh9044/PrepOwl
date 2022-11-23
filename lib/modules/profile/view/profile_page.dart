// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/modules/profile/view/user_details_ui/complete_profile_form.dart';
import 'package:prepowl/modules/welcome/view/welcome_screen_ui/background.dart';

import '../../../_utils/res/dimen.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimen.size20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      AppConst.completeProfileHeading,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimen.size24),
                    ),
                    const SizedBox(height: AppDimen.size20),
                    const Text(
                      AppConst.secondHeading,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: AppDimen.size20),
                    ),
                    const SizedBox(height: AppDimen.size20),
                    const CompleteProfileForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
