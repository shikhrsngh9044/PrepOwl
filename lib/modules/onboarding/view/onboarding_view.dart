import 'package:flutter/material.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/ui_components/buttons.dart';
import '../../../_utils/res/dimen.dart';
import 'onboarding_item.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimen.size20, vertical: AppDimen.size30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Text(
                AppConst.fastEasyWayToPrepare,
                style: TextStyle(
                  fontSize: AppDimen.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: AppDimen.size10,
              ),
              const Text(
                AppConst.selectExamCategory,
                style: TextStyle(
                  fontSize: AppDimen.size18,
                ),
              ),
              const SizedBox(
                height: AppDimen.size10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 175,
                child: Wrap(
                  children: List<Widget>.generate(
                    15,
                    (index) => OnboardingItem(index: index),
                  ).toList(),
                ),
              ),
              PrimaryButton(btnText: AppConst.submit, onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
