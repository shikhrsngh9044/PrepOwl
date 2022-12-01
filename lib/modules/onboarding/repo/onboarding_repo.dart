import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../model/exam_category_dto.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';

abstract class OnboardingRepository {
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamList();
}

class OnboardingRepositotyImpl implements OnboardingRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<ExamCategoryDTO>>> getAllExamList() async {
    List<ExamCategoryDTO> examCategories = [];

    try {
      final results = await firestore.collection(AppConst.collectionName).get();

      for (final snapshot in results.docs) {
        ExamCategoryDTO newexamCategories =
            ExamCategoryDTO.fromJson(snapshot.data());

        examCategories.add(newexamCategories);
      }

      return right(examCategories);
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }
}
