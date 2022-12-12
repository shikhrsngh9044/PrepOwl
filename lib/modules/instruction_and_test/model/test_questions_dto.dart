import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'test_options_dto.dart';

class TestQuestionsDTO {
  final String id;
  final String question;
  final List<String>? images;
  final List<TestOptionsDTO> options;

  TestQuestionsDTO({
    required this.id,
    required this.question,
    this.images,
    required this.options,
  });

  TestQuestionsDTO copyWith({
    String? id,
    String? question,
    List<String>? images,
    List<TestOptionsDTO>? options,
  }) {
    return TestQuestionsDTO(
      id: id ?? this.id,
      question: question ?? this.question,
      images: images ?? this.images,
      options: options ?? this.options,
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
              (map['images'] as List<String>),
            )
          : null,
      options: List<TestOptionsDTO>.from(
        (map['options'] as List<int>).map<TestOptionsDTO>(
          (x) => TestOptionsDTO.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
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
      );

  @override
  String toString() {
    return 'TestQuestionsDTO(id: $id, question: $question, images: $images, options: $options)';
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
        );
  }

  @override
  int get hashCode {
    return id.hashCode ^ question.hashCode ^ images.hashCode ^ options.hashCode;
  }
}
