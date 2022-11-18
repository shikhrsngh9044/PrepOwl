import 'dart:convert';

class UserDTO {
  final String? uid;
  final String? photoUrl;
  final String? email;
  final String? name;

  UserDTO({
    this.uid,
    this.photoUrl,
    this.email,
    this.name,
  });

  UserDTO copyWith({
    String? uid,
    String? photoUrl,
    String? email,
    String? name,
  }) {
    return UserDTO(
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

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      uid: map['uid'] != null ? map['uid'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDTO(uid: $uid, photoUrl: $photoUrl, email: $email, name: $name)';
  }

  @override
  bool operator ==(covariant UserDTO other) {
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
