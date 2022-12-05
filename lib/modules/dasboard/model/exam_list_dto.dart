import 'dart:convert';

class ExamListDTO {
  final String parentId;
  final String id;
  final String title;

  ExamListDTO({
    required this.parentId,
    required this.id,
    required this.title,
  });

  ExamListDTO copyWith({
    String? parentId,
    String? id,
    String? title,
  }) {
    return ExamListDTO(
      parentId: parentId ?? this.parentId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parent_id': parentId,
      'id': id,
      'title': title,
    };
  }

  factory ExamListDTO.fromMap(Map<String, dynamic> map) {
    return ExamListDTO(
      parentId: map['parent_id'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamListDTO.fromJson(Map<String, dynamic> json) => ExamListDTO(
        parentId: json['parent_id'],
        id: json['id'],
        title: json['title'],
      );

  @override
  String toString() =>
      'ExamListDTO(parent_id: $parentId, id: $id, title: $title)';

  @override
  bool operator ==(covariant ExamListDTO other) {
    if (identical(this, other)) return true;

    return other.parentId == parentId && other.id == id && other.title == title;
  }

  @override
  int get hashCode => parentId.hashCode ^ id.hashCode ^ title.hashCode;
}
