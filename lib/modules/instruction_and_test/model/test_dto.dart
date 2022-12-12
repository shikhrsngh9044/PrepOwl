import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'test_questions_dto.dart';

class TestDTO {
  final String id;
  final String testId;
  final String instructions;
  final List<TestQuestionsDTO> questions;
  final String timeDuration;

  TestDTO({
    required this.id,
    required this.testId,
    required this.instructions,
    required this.questions,
    required this.timeDuration,
  });

  TestDTO copyWith({
    String? id,
    String? testId,
    String? instructions,
    List<TestQuestionsDTO>? questions,
    String? timeDuration,
  }) {
    return TestDTO(
      id: id ?? this.id,
      testId: testId ?? this.testId,
      instructions: instructions ?? this.instructions,
      questions: questions ?? this.questions,
      timeDuration: timeDuration ?? this.timeDuration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'test_id': testId,
      'instruction': instructions,
      'questions': questions
          .map(
            (x) => x.toMap(),
          )
          .toList(),
      'time_duration': timeDuration,
    };
  }

  factory TestDTO.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestDTO(
      id: map['id'] as String,
      testId: map['test_id'] as String,
      instructions: map['instruction'] as String,
      questions: List<TestQuestionsDTO>.from(
        (map['questions'] as List<dynamic>).map<TestQuestionsDTO>(
          (x) => TestQuestionsDTO.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
      timeDuration: map['time_duration'] as String,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory TestDTO.fromJson(Map<String, dynamic> json) => TestDTO(
        id: json['id'],
        testId: json['test_id'],
        instructions: json['instruction'],
        questions: json['questions'],
        timeDuration: json['time_duration'],
      );

  @override
  String toString() =>
      'TestDTO(id: $id,test_id: $testId, instruction: $instructions, questions: $questions, time_duration: $timeDuration,)';

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
        ) &&
        other.timeDuration == timeDuration;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      testId.hashCode ^
      instructions.hashCode ^
      questions.hashCode ^
      timeDuration.hashCode;
}
