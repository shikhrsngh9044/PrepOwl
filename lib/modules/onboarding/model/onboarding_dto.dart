import 'dart:convert';

class OnboardingDTO {
  final String id;
  final String title;
  OnboardingDTO({
    required this.id,
    required this.title,
  });

  OnboardingDTO copyWith({
    String? id,
    String? title,
  }) {
    return OnboardingDTO(
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

  factory OnboardingDTO.fromMap(Map<String, dynamic> map) {
    return OnboardingDTO(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingDTO.fromJson(Map<String, dynamic> json) => OnboardingDTO(
        id: json['id'],
        title: json['title'],
      );

  // @override
  // String toString() => 'OnboardingDTO(id: $id, title: $title)';
}
