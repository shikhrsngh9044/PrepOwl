import 'package:flutter/material.dart';
import 'package:prepowl/_utils/helpers/global.dart';
import 'dart:math';

import '../../../_utils/res/dimen.dart';
import '../model/onboarding_dto.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {Key? key, required this.index, required this.onboardingList})
      : super(key: key);

  final int index;
  final OnboardingDTO onboardingList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.size5),
      child: FilterChip(
        elevation: 5,
        padding: const EdgeInsets.all(AppDimen.size10),
        backgroundColor: Colors
            .primaries[Random().nextInt(Colors.primaries.length)]
            .withOpacity(0.6),
        label: Text(
          onboardingList.title,
          style: const TextStyle(
            fontSize: AppDimen.size16,
          ),
        ),
        shape: const StadiumBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
        onSelected: (bool value) {
          printDebug("${index + 1}");
        },
      ),
    );
  }
}
