import 'dart:convert';

class DoubtImagesDTO {
  final String? id;
  final String? doubtImages;
  DoubtImagesDTO({
    this.id,
    this.doubtImages,
  });

  DoubtImagesDTO copyWith({
    String? id,
    String? doubtImages,
  }) {
    return DoubtImagesDTO(
      id: id ?? this.id,
      doubtImages: doubtImages ?? this.doubtImages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': doubtImages,
    };
  }

  factory DoubtImagesDTO.fromMap(Map<String, dynamic> map) {
    return DoubtImagesDTO(
      id: map['id'] != null ? map['id'] as String : null,
      doubtImages: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoubtImagesDTO.fromJson(String source) =>
      DoubtImagesDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DoubtImagesDTO(id: $id, image: $doubtImages)';

  @override
  bool operator ==(covariant DoubtImagesDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.doubtImages == doubtImages;
  }

  @override
  int get hashCode => id.hashCode ^ doubtImages.hashCode;
}
