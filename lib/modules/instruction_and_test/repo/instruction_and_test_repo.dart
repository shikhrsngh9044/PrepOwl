import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';
import '../../../_utils/helpers/global.dart';
import '../model/test_dto.dart';

abstract class InstructionAndTestRepository {
  Future<APIResponse<List<TestDTO>>> getInstructionsAndQuestion(
    String testId,
  );
}

class InstructionAndTestRepositotyImpl implements InstructionAndTestRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<TestDTO>>> getInstructionsAndQuestion(
      String testId) async {
    List<TestDTO> instructionAndQuestionsList = [];

    try {
      final results = await firestore
          .collection(
            DBConst.examTestCollectionName,
          )
          .where(
            'test_id',
            isEqualTo: testId,
          )
          .get();
      for (var snapshot in results.docs) {
        try {
          TestDTO newInstructionAndQuestionsList = TestDTO.fromMap(
            snapshot.data(),
          );

          instructionAndQuestionsList.add(
            newInstructionAndQuestionsList,
          );
        } catch (e) {
          printDebug(snapshot.data());
        }
      }
      return right(
        instructionAndQuestionsList,
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
