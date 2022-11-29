import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:prepowl/_utils/constants/routes.dart';
import 'package:prepowl/modules/signup/controller/signup_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const RegisterPageScreen(),
    );
  }
}

class RegisterPageScreen extends StatelessWidget {
  const RegisterPageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.isRegistering) {
          Get.offAndToNamed(RouteNames.register);
        } else {
          Get.offAndToNamed(RouteNames.loginPage);
        }
      },
      builder: (context, state) {
        if (state.isRegistering) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Text("Gmail: $state.gmail");
        }
      },
    ));
  }
}

//