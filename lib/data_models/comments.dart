import 'package:flutter/material.dart';

class Comment {
  String commentId;
  String postId;
  String commentUserId;
  String comment;
  DateTime commentDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Comment({
    @required this.commentId,
    @required this.postId,
    @required this.commentUserId,
    @required this.comment,
    @required this.commentDateTime,
  });

  Comment copyWith({
    String commentId,
    String postId,
    String commentUserId,
    String comment,
    DateTime commentDateTime,
  }) {
    return new Comment(
      commentId: commentId ?? this.commentId,
      postId: postId ?? this.postId,
      commentUserId: commentUserId ?? this.commentUserId,
      comment: comment ?? this.comment,
      commentDateTime: commentDateTime ?? this.commentDateTime,
    );
  }

  @override
  String toString() {
    return 'Comment{commentId: $commentId, postId: $postId, commentUserId: $commentUserId, comment: $comment, commentDateTime: $commentDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          runtimeType == other.runtimeType &&
          commentId == other.commentId &&
          postId == other.postId &&
          commentUserId == other.commentUserId &&
          comment == other.comment &&
          commentDateTime == other.commentDateTime);

  @override
  int get hashCode =>
      commentId.hashCode ^
      postId.hashCode ^
      commentUserId.hashCode ^
      comment.hashCode ^
      commentDateTime.hashCode;

  factory Comment.fromMap(Map<String, dynamic> map) {
    return new Comment(
      commentId: map['commentId'] as String,
      postId: map['postId'] as String,
      commentUserId: map['commentUserId'] as String,
      comment: map['comment'] as String,
      commentDateTime: map['commentDateTime'] == null
          ? null
          : DateTime.parse(map['commentDateTime'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'commentId': this.commentId,
      'postId': this.postId,
      'commentUserId': this.commentUserId,
      'comment': this.comment,
      'commentDateTime': this.commentDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
