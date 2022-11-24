import 'package:flutter/material.dart';
import 'package:prepowl/_utils/helpers/global.dart';
import 'dart:math';
import '../../../../_utils/res/dimen.dart';
import '../../model/onboarding_dto.dart';

class ExamCategoryItemChip extends StatelessWidget {
  const ExamCategoryItemChip({Key? key, required this.examCategoryList})
      : super(key: key);

  final ExamCategoryDTO examCategoryList;

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
          examCategoryList.title,
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
          printDebug(value);
        },
      ),
    );
  }
}
