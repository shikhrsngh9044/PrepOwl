import 'dart:convert';

class TestOptionsDTO {
  final String id;
  final String? optionImage;
  final String? optionTitle;

  TestOptionsDTO({
    required this.id,
    this.optionImage,
    this.optionTitle,
  });

  TestOptionsDTO copyWith({
    String? id,
    String? optionImage,
    String? optionTitle,
  }) {
    return TestOptionsDTO(
      id: id ?? this.id,
      optionImage: optionImage ?? this.optionImage,
      optionTitle: optionTitle ?? this.optionTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'option_image': optionImage,
      'option_title': optionTitle,
    };
  }

  factory TestOptionsDTO.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestOptionsDTO(
      id: map['id'] as String,
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
        optionImage: json['option_image'],
        optionTitle: json['option_title'],
      );

  @override
  String toString() {
    return 'TestOptionsDTO(id: $id,option_image: $optionImage, option_title: $optionTitle)';
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
        other.optionImage == optionImage &&
        other.optionTitle == optionTitle;
  }

  @override
  int get hashCode {
    return id.hashCode ^ optionImage.hashCode ^ optionTitle.hashCode;
  }
}
