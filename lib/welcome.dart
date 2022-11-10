import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prepowl/_utils/constants/routes.dart';
import 'package:prepowl/_utils/ui_components/buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welocme To PrepOwl"),
          const SizedBox(height: 30.0),
          PrimaryButton(
            btnText: "Login",
            onPressed: () {
              Get.offAndToNamed(RouteNames.loginPage);
            },
          )
        ],
      ),
    );
  }
}
