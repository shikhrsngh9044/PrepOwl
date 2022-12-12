import 'dart:convert';

class TestOptionsDTO {
  final String id;
  final bool isAnswerCorrect;
  final String? optionImage;
  final String? optionTitle;
  final bool isSelectedAnswer;

  TestOptionsDTO({
    required this.id,
    required this.isAnswerCorrect,
    this.optionImage,
    this.optionTitle,
    this.isSelectedAnswer = false,
  });

  TestOptionsDTO copyWith({
    String? id,
    bool? isAnswerCorrect,
    String? optionImage,
    String? optionTitle,
    bool? isSelectedAnswer,
  }) {
    return TestOptionsDTO(
      id: id ?? this.id,
      isAnswerCorrect: isAnswerCorrect ?? this.isAnswerCorrect,
      optionImage: optionImage ?? this.optionImage,
      optionTitle: optionTitle ?? this.optionTitle,
      isSelectedAnswer: isSelectedAnswer ?? this.isSelectedAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isCorrectAnswer': isAnswerCorrect,
      'option_image': optionImage,
      'option_title': optionTitle,
    };
  }

  factory TestOptionsDTO.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestOptionsDTO(
      id: map['id'] as String,
      isAnswerCorrect: map['isCorrectAnswer'] as bool,
      optionImage:
          map['option_image'] != null ? map['option_image'] as String : null,
      optionTitle:
          map['option_title'] != null ? map['option_title'] as String : null,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory TestOptionsDTO.fromJson(Map<String, dynamic> json) => TestOptionsDTO(
        id: json['id'],
        isAnswerCorrect: json['isCorrectAnswer'],
        optionImage: json['option_image'],
        optionTitle: json['option_title'],
      );

  @override
  String toString() {
    return 'TestOptionsDTO(id: $id, isCorrectAnswer: $isAnswerCorrect, option_image: $optionImage, option_title: $optionTitle)';
  }

  @override
  bool operator ==(
    covariant TestOptionsDTO other,
  ) {
    if (identical(
      this,
      other,
    )) return true;

    return other.id == id &&
        other.isAnswerCorrect == isAnswerCorrect &&
        other.optionImage == optionImage &&
        other.optionTitle == optionTitle &&
        other.isSelectedAnswer == isSelectedAnswer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isAnswerCorrect.hashCode ^
        optionImage.hashCode ^
        optionTitle.hashCode ^
        isSelectedAnswer.hashCode;
  }
}
