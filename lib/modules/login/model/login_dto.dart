import 'dart:convert';

class LoginDTO {
  final String? uid;
  final String? photoUrl;
  final String? email;
  final String? name;

  LoginDTO({
    this.uid,
    this.photoUrl,
    this.email,
    this.name,
  });

  LoginDTO copyWith({
    String? uid,
    String? photoUrl,
    String? email,
    String? name,
  }) {
    return LoginDTO(
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'photoUrl': photoUrl,
      'email': email,
      'name': name,
    };
  }

  factory LoginDTO.fromMap(Map<String, dynamic> map) {
    return LoginDTO(
      uid: map['uid'] != null ? map['uid'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDTO.fromJson(String source) =>
      LoginDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginDTO(uid: $uid, photoUrl: $photoUrl, email: $email, name: $name)';
  }

  @override
  bool operator ==(covariant LoginDTO other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.photoUrl == photoUrl &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ photoUrl.hashCode ^ email.hashCode ^ name.hashCode;
  }
}
