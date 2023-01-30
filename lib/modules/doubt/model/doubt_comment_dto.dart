import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoubtCommentDTO {
  final String id;
  final String userid;
  final String? comment;
  final Timestamp? createdAt;
  final int? likes;
  final int? dislikes;
  final String? name;
  final String? profilePic;

  DoubtCommentDTO(
    this.id,
    this.userid,
    this.comment,
    this.createdAt,
    this.likes,
    this.dislikes,
    this.name,
    this.profilePic,
  );

  DoubtCommentDTO copyWith({
    String? id,
    String? userid,
    String? comment,
    Timestamp? createdAt,
    int? likes,
    int? dislikes,
    String? name,
    String? profilePic,
  }) {
    return DoubtCommentDTO(
      id ?? this.id,
      userid ?? this.userid,
      comment ?? this.comment,
      createdAt ?? this.createdAt,
      likes ?? this.likes,
      dislikes ?? this.dislikes,
      name ?? this.name,
      profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userid,
      'comment': comment,
      'created_at': createdAt,
      'likes': likes,
      'dislikes': dislikes,
      'name': name,
      'profile_pic': profilePic,
    };
  }

  factory DoubtCommentDTO.fromMap(Map<String, dynamic> map) {
    return DoubtCommentDTO(
      map['id'] as String,
      map['user_id'] as String,
      map['comment'] != null ? map['comment'] as String : null,
      map['created_at'] != null ? map['created_at'] as Timestamp : null,
      map['likes'] != null ? map['likes'] as int : null,
      map['dislikes'] != null ? map['dislikes'] as int : null,
      map['name'] != null ? map['name'] as String : null,
      map['profile_pic'] != null ? map['profile_pic'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoubtCommentDTO.fromJson(String source) =>
      DoubtCommentDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoubtCommentDTO(id: $id, user_id: $userid, comment: $comment, created_at: $createdAt, likes: $likes, dislikes: $dislikes, name: $name, profile_pic: $profilePic)';
  }

  @override
  bool operator ==(covariant DoubtCommentDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userid == userid &&
        other.comment == comment &&
        other.createdAt == createdAt &&
        other.likes == likes &&
        other.dislikes == dislikes &&
        other.name == name &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userid.hashCode ^
        comment.hashCode ^
        createdAt.hashCode ^
        likes.hashCode ^
        dislikes.hashCode ^
        name.hashCode ^
        profilePic.hashCode;
  }
}
