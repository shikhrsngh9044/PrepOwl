import 'dart:convert';

class UserModel {
  final String phoneNumber;
  final String username;
  final String fullName;
  final String profilePic;

  UserModel({
    required this.phoneNumber,
    required this.username,
    required this.fullName,
    this.profilePic = "",
  });

  UserModel copyWith({
    String? phoneNumber,
    String? username,
    String? fullName,
    String? profilePic,
  }) {
    return UserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'username': username,
      'fullName': fullName,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map['phoneNumber'] ?? '',
      username: map['username'] ?? '',
      fullName: map['fullName'] ?? '',
      profilePic: map['profilePic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(phoneNumber: $phoneNumber, username: $username, fullName: $fullName, profilePic: $profilePic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.phoneNumber == phoneNumber &&
        other.username == username &&
        other.fullName == fullName &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return phoneNumber.hashCode ^
        username.hashCode ^
        fullName.hashCode ^
        profilePic.hashCode;
  }
}
