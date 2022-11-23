import 'package:flutter/material.dart';
import 'package:prepowl/_utils/helpers/global.dart';
import 'dart:math';

import '../../../_utils/res/dimen.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({Key? key, required this.index}) : super(key: key);

  final int index;
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
          index % 3 == 0
              ? 'Exam Category ${index + 1}'
              : ' Category ${index + 1}',
          style: const TextStyle(
            fontSize: AppDimen.size16,
          ),
        ),
        shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: index % 2 == 0 ? Colors.black : Colors.white,
          ),
        ),
        onSelected: (bool value) {
          printDebug("${index + 1}");
        },
      ),
    );
  }
}
