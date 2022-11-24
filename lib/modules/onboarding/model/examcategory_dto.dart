import 'dart:convert';

class ExamCategoryDTO {
  final String id;
  final String title;
  ExamCategoryDTO({
    required this.id,
    required this.title,
  });

  ExamCategoryDTO copyWith({
    String? id,
    String? title,
  }) {
    return ExamCategoryDTO(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory ExamCategoryDTO.fromMap(Map<String, dynamic> map) {
    return ExamCategoryDTO(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamCategoryDTO.fromJson(Map<String, dynamic> json) =>
      ExamCategoryDTO(
        id: json['id'],
        title: json['title'],
      );

  // @override
  // String toString() => 'ExamCategoryDTO(id: $id, title: $title)';
}
