import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'test_questions_dto.dart';

class TestDTO {
  final String id;
  final String testId;
  final String instructions;
  final List<TestQuestionsDTO> questions;

  TestDTO({
    required this.id,
    required this.testId,
    required this.instructions,
    required this.questions,
  });

  TestDTO copyWith({
    String? id,
    String? testId,
    String? instructions,
    List<TestQuestionsDTO>? questions,
  }) {
    return TestDTO(
      id: id ?? this.id,
      testId: testId ?? this.testId,
      instructions: instructions ?? this.instructions,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'test_id': testId,
      'instructions': instructions,
      'questions': questions
          .map(
            (x) => x.toMap(),
          )
          .toList(),
    };
  }

  factory TestDTO.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestDTO(
      id: map['id'] as String,
      testId: map['test_id'] as String,
      instructions: map['instructions'] as String,
      questions: List<TestQuestionsDTO>.from(
        (map['questions'] as List<TestQuestionsDTO>).map<TestQuestionsDTO>(
          (x) => TestQuestionsDTO.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory TestDTO.fromJson(Map<String, dynamic> json) => TestDTO(
        id: json['id'],
        testId: json['test_id'],
        instructions: json['instructions'],
        questions: json['questions'],
      );

  @override
  String toString() =>
      'TestDTO(id: $id,test_id: $testId, instructions: $instructions, questions: $questions)';

  @override
  bool operator ==(
    covariant TestDTO other,
  ) {
    if (identical(
      this,
      other,
    )) return true;

    return other.id == id &&
        other.testId == testId &&
        other.instructions == instructions &&
        listEquals(
          other.questions,
          questions,
        );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      testId.hashCode ^
      instructions.hashCode ^
      questions.hashCode;
}
