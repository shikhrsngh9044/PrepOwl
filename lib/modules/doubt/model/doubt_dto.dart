// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:prepowl/modules/doubt/model/doubt_images_dto.dart';

import 'doubt_comment_dto.dart';

class DoubtDTO {
  final String id;
  final String userid;
  final String name;
  final String description;
  final String examCategory;
  final String examCategoryId;
  final String profilePic;
  final bool isBookMarked;
  final bool isClosed;
  final List<DoubtCommentDTO> comments;
  final List<DoubtImagesDTO> images;
  final Timestamp createdAt;
  DoubtDTO({
    required this.id,
    required this.userid,
    required this.name,
    required this.description,
    required this.examCategory,
    required this.examCategoryId,
    required this.profilePic,
    this.isBookMarked = false,
    this.isClosed = false,
    required this.comments,
    required this.images,
    required this.createdAt,
  });

  DoubtDTO copyWith({
    String? id,
    String? userid,
    String? name,
    String? description,
    String? examCategory,
    String? examCategoryId,
    String? profilePic,
    bool? isBookMarked,
    bool? isClosed,
    List<DoubtCommentDTO>? comments,
    List<DoubtImagesDTO>? images,
    Timestamp? createdAt,
  }) {
    return DoubtDTO(
      id: id ?? this.id,
      userid: userid ?? this.userid,
      name: name ?? this.name,
      description: description ?? this.description,
      examCategory: examCategory ?? this.examCategory,
      examCategoryId: examCategoryId ?? this.examCategoryId,
      profilePic: profilePic ?? this.profilePic,
      isBookMarked: isBookMarked ?? this.isBookMarked,
      isClosed: isClosed ?? this.isClosed,
      comments: comments ?? this.comments,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userid,
      'name': name,
      'description': description,
      'exam_category': examCategory,
      'exam_category_id': examCategoryId,
      'profile_pic': profilePic,
      'is_bookmarked': isBookMarked,
      'is_closed': isClosed,
      'comments': comments.map((x) => x.toMap()).toList(),
      'images': images.map((x) => x.toMap()).toList(),
      'created_at': createdAt,
    };
  }

  factory DoubtDTO.fromMap(Map<String, dynamic> map) {
    return DoubtDTO(
      id: map['id'] as String,
      userid: map['user_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      examCategory: map['exam_category'] as String,
      examCategoryId: map['exam_category_id'] as String,
      profilePic: map['profile_pic'] as String,
      comments: List<DoubtCommentDTO>.from(
        (map['comments'] as List<dynamic>).map<DoubtCommentDTO>(
          (x) => DoubtCommentDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
      images: List<DoubtImagesDTO>.from(
        (map['images'] as List<dynamic>).map<DoubtImagesDTO>(
          (x) => DoubtImagesDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdAt: map['created_at'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoubtDTO.fromJson(String source) =>
      DoubtDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoubtDTO(id: $id, user_id: $userid, name: $name, description: $description, exam_category: $examCategory, exam_category_id: $examCategoryId, profile_pic: $profilePic,  is_bookmarked: $isBookMarked, is_closed: $isClosed, comments: $comments,images: $images, created_at: $createdAt)';
  }

  @override
  bool operator ==(covariant DoubtDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userid == userid &&
        other.name == name &&
        other.description == description &&
        other.examCategory == examCategory &&
        other.examCategoryId == examCategoryId &&
        other.profilePic == profilePic &&
        other.isBookMarked == isBookMarked &&
        other.isClosed == isClosed &&
        listEquals(other.comments, comments) &&
        listEquals(other.images, images) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userid.hashCode ^
        name.hashCode ^
        description.hashCode ^
        examCategory.hashCode ^
        examCategoryId.hashCode ^
        profilePic.hashCode ^
        isBookMarked.hashCode ^
        isClosed.hashCode ^
        comments.hashCode ^
        images.hashCode ^
        createdAt.hashCode;
  }
}
