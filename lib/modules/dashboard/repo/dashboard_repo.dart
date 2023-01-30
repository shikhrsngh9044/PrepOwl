import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';
import '../../onboarding/model/exam_category_dto.dart';
import '../model/test_list_dto.dart';

abstract class DashboardRepository {
  Future<APIResponse<List<TestListDTO>>> getTestList(
    String parentId,
  );
  Future<APIResponse<List<TestListDTO>>> getAllTestList(
    List<ExamCategoryDTO> examCategoryList,
  );
}

class DashboardRepositotyImpl implements DashboardRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<TestListDTO>>> getTestList(
    String examCategoryId,
  ) async {
    List<TestListDTO> testList = [];

    try {
      final results = await firestore
          .collection(
            DBConst.testCollectionName,
          )
          .where(
            'exam_category_id',
            isEqualTo: examCategoryId,
          )
          .get();

      for (var snapshot in results.docs) {
        TestListDTO newTestList = TestListDTO.fromJson(
          snapshot.data(),
        );

        testList.add(
          newTestList,
        );
      }
      return right(
        testList,
      );
    } catch (e) {
      return left(
        Failure(
          code: 500,
          response: e.toString(),
        ),
      );
    }
  }

  @override
  Future<APIResponse<List<TestListDTO>>> getAllTestList(
    List<ExamCategoryDTO> examCategoryList,
  ) async {
    List<TestListDTO> testList = [];

    try {
      final examCategoryIds = [];
      for (var item in examCategoryList) {
        examCategoryIds.add(
          item.id,
        );
      }
      final results = await firestore
          .collection(
            DBConst.testCollectionName,
          )
          .where(
            'exam_category_id',
            whereIn: examCategoryIds,
          )
          .get();

      for (var snapshot in results.docs) {
        TestListDTO newTestList = TestListDTO.fromJson(
          snapshot.data(),
        );

        testList.add(
          newTestList,
        );
      }
      return right(
        testList,
      );
    } catch (e) {
      return left(
        Failure(
          code: 500,
          response: e.toString(),
        ),
      );
    }
  }
}
