import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'test_options_dto.dart';

class TestQuestionsDTO {
  final String id;
  final String question;
  final List<String>? images;
  final List<TestOptionsDTO> options;
  final String answerId;
  String? selectedOptionID;

  TestQuestionsDTO({
    required this.id,
    required this.question,
    this.images,
    required this.options,
    required this.answerId,
    this.selectedOptionID,
  });

  TestQuestionsDTO copyWith(
      {String? id,
      String? question,
      List<String>? images,
      List<TestOptionsDTO>? options,
      String? answerId,
      String? selectedOptionID}) {
    return TestQuestionsDTO(
      id: id ?? this.id,
      question: question ?? this.question,
      images: images ?? this.images,
      options: options ?? this.options,
      answerId: answerId ?? this.answerId,
      selectedOptionID: selectedOptionID ?? this.selectedOptionID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'images': images,
      'options': options
          .map(
            (x) => x.toMap(),
          )
          .toList(),
      'answer_id': answerId,
    };
  }

  factory TestQuestionsDTO.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestQuestionsDTO(
      id: map['id'] as String,
      question: map['question'] as String,
      images: map['images'] != null
          ? List<String>.from(
              (map['images'] as List<dynamic>),
            )
          : null,
      options: List<TestOptionsDTO>.from(
        (map['options'] as List<dynamic>).map<TestOptionsDTO>(
          (x) => TestOptionsDTO.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
      answerId: map['answer_id'] as String,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory TestQuestionsDTO.fromJson(Map<String, dynamic> json) =>
      TestQuestionsDTO(
        id: json['id'],
        question: json['question'],
        images: json['images'],
        options: json['options'],
        answerId: json['answer_id'],
      );

  @override
  String toString() {
    return 'TestQuestionsDTO(id: $id, question: $question, images: $images, options: $options, answer_id: $answerId)';
  }

  @override
  bool operator ==(
    covariant TestQuestionsDTO other,
  ) {
    if (identical(
      this,
      other,
    )) return true;

    return other.id == id &&
        other.question == question &&
        listEquals(
          other.images,
          images,
        ) &&
        listEquals(
          other.options,
          options,
        ) &&
        other.answerId == answerId &&
        other.selectedOptionID == selectedOptionID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        images.hashCode ^
        options.hashCode ^
        answerId.hashCode ^
        selectedOptionID.hashCode;
  }
}
