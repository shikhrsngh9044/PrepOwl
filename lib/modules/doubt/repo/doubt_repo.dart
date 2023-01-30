import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:prepowl/_utils/helpers/global.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';
import '../model/doubt_dto.dart';

abstract class DoubtAndCommentRepository {
  Future<APIResponse<List<DoubtDTO>>> getDoubtAndCommentList();
}

class DoubtAndCommentRepositoryImpl implements DoubtAndCommentRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<DoubtDTO>>> getDoubtAndCommentList() async {
    List<DoubtDTO> doubtAndCommentsList = [];

    try {
      final results = await firestore
          .collection(
            DBConst.doubtCollectionName,
          )
          .get();
      for (var snapshot in results.docs) {
        try {
          DoubtDTO newDoubtAndCommentsList = DoubtDTO.fromMap(
            snapshot.data(),
          );

          doubtAndCommentsList.add(
            newDoubtAndCommentsList,
          );
        } catch (e) {
          printDebug(snapshot.data());
        }
      }
      return right(
        doubtAndCommentsList,
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
