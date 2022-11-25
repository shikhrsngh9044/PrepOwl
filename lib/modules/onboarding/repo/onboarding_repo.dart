import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';

import '../model/onboarding_dto.dart';

abstract class OnboardingRepository {
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamList();
}

class OnboardingRepositotyImpl implements OnboardingRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamList() async {
    List<ExamCategoryDTO> onboarding = [];
    try {
      final results = await firestore.collection(AppConst.collectionName).get();
      for (var snapshot in results.docs) {
        ExamCategoryDTO newOnboarding =
            ExamCategoryDTO.fromJson(snapshot.data());

        onboarding.add(newOnboarding);
      }
      return right(onboarding);
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }
}
