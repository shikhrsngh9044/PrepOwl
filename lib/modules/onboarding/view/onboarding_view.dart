import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/constants/string_constants.dart';
import 'package:prepowl/_utils/res/dimen.dart';
import 'package:prepowl/_utils/ui_components/buttons.dart';
import '../controller/onboarding_bloc.dart';
import 'widgets/exam_category_chip.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc()..add(GetAllExamList()),
      child: const OnboardingUI(),
    );
  }
}

class OnboardingUI extends StatelessWidget {
  const OnboardingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
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
            return Padding(
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
                          state.onboardingList.length,
                          (index) => ExamCategoryChip(
                              onboardingList: state.onboardingList[index],
                              state: state),
                        ).toList(),
                      ),
                    ),
                    if (state.selectedOnboardingList.isNotEmpty)
                      PrimaryButton(
                        btnText: AppConst.submit,
                        onPressed: () {},
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
