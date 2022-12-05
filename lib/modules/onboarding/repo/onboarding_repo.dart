import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';
import '../model/exam_category_dto.dart';

abstract class OnboardingRepository {
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamCategoryList();
}

class OnboardingRepositotyImpl implements OnboardingRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamCategoryList() async {
    List<ExamCategoryDTO> examCategories = [];
    try {
      final results =
          await firestore.collection(DBConst.examCategoryCollectionName).get();

      for (var snapshot in results.docs) {
        ExamCategoryDTO newExamCategories =
            ExamCategoryDTO.fromJson(snapshot.data());

        examCategories.add(newExamCategories);
      }

      return right(examCategories);
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }
}
