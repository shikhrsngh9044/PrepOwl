// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:prepowl/_utils/constants/routes.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/modules/register/controller/profile_bloc.dart';
import 'package:prepowl/modules/register/view/register_details_ui/register_form.dart';
import 'package:prepowl/modules/welcome/view/welcome_screen_ui/background.dart';

import '../../../_utils/res/dimen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: const RegisterScreenUI(),
    );
  }
}

class RegisterScreenUI extends StatelessWidget {
  const RegisterScreenUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state.isSuccess) {
          Get.offAndToNamed(RouteNames.onboarding);
        }
      }, builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.red,
            ),
          );
        } else {
          return Background(
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
                    CompleteRegisterForm(state: state),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
