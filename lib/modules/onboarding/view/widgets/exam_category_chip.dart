import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_utils/res/dimen.dart';
import '../../controller/onboarding_bloc.dart';
import '../../model/exam_category_dto.dart';

class ExamCategoryChip extends StatelessWidget {
  const ExamCategoryChip(
      {Key? key, required this.onboardingList, required this.state})
      : super(key: key);

  final ExamCategoryDTO onboardingList;
  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.size5),
      child: FilterChip(
        elevation: 5,
        padding: const EdgeInsets.all(AppDimen.size10),
        // backgroundColor: Colors
        //     .primaries[Random().nextInt(Colors.primaries.length)]
        //     .withOpacity(0.6),
        label: Text(
          onboardingList.title,
          style: const TextStyle(
            fontSize: AppDimen.size16,
          ),
        ),
        shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: state.selectedOnboardingList.contains(onboardingList)
                ? Colors.black
                : Colors.white,
          ),
        ),
        onSelected: (bool value) {
          if (state.selectedOnboardingList.contains(onboardingList)) {
            context
                .read<OnboardingBloc>()
                .add(DeleteFromSelectedList(onboardingList));
          } else if (state.selectedOnboardingList.length != 3) {
            context
                .read<OnboardingBloc>()
                .add(AddToSelectedList(onboardingList));
          }
        },
      ),
    );
  }
}
