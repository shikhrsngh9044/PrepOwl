import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../model/exam_list_dto.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';

abstract class DashboardRepository {
  Future<APIResponse<List<ExamListDTO>>> getAllExamList(String parentId);
}

class DashboardRepositotyImpl implements DashboardRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<ExamListDTO>>> getAllExamList(String parentId) async {
    List<ExamListDTO> examList = [];

    try {
      final results = await firestore
          .collection(DBConst.examCollectionName)
          .where('parent_id', isEqualTo: parentId)
          .get();
      for (var snapshot in results.docs) {
        ExamListDTO newExamList = ExamListDTO.fromJson(snapshot.data());

        examList.add(newExamList);
      }
      return right(examList);
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }
}
