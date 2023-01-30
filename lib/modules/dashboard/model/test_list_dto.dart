import 'dart:convert';

class TestListDTO {
  final String examId;
  final String id;
  final String testName;
  final String examCategoryId;

  TestListDTO({
    required this.examId,
    required this.id,
    required this.testName,
    required this.examCategoryId,
  });

  TestListDTO copyWith({
    String? examId,
    String? id,
    String? testName,
    String? examCategoryId,
  }) {
    return TestListDTO(
      examId: examId ?? this.examId,
      id: id ?? this.id,
      testName: testName ?? this.testName,
      examCategoryId: examCategoryId ?? this.examCategoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exam_id': examId,
      'id': id,
      'test_name': testName,
      'exam_category_id': examCategoryId,
    };
  }

  factory TestListDTO.fromMap(Map<String, dynamic> map) {
    return TestListDTO(
      examId: map['exam_id'] as String,
      id: map['id'] as String,
      testName: map['test_name'] as String,
      examCategoryId: map['exam_category_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestListDTO.fromJson(Map<String, dynamic> json) => TestListDTO(
        examId: json['exam_id'],
        id: json['id'],
        testName: json['test_name'],
        examCategoryId: json['exam_category_id'],
      );

  @override
  String toString() =>
      'TestListDTO(exam_id: $examId, id: $id, test_name: $testName, exam_category_id: $examCategoryId)';

  @override
  bool operator ==(covariant TestListDTO other) {
    if (identical(this, other)) return true;

    return other.examId == examId &&
        other.id == id &&
        other.testName == testName &&
        other.examCategoryId == examCategoryId;
  }

  @override
  int get hashCode =>
      examId.hashCode ^
      id.hashCode ^
      testName.hashCode ^
      examCategoryId.hashCode;
}
