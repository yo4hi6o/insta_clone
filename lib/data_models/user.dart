import 'package:flutter/material.dart';

class User {
  final String userId;
  final String displayName; //Firebaseに登録したUser情報に紐付いているユーザー名
  final String inAppUserName;//このアプリの中で編集できるユーザー名（さいしょはdisplayNameと同じ）
  final String photoUrl;
  final String email;
  final String bio;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const User({
    @required this.userId,
    @required this.displayName,
    @required this.inAppUserName,
    @required this.photoUrl,
    @required this.email,
    @required this.bio,
  });

  User copyWith({
    String userId,
    String displayName,
    String inAppUserName,
    String photoUrl,
    String email,
    String bio,
  }) {
    if ((userId == null || identical(userId, this.userId)) &&
        (displayName == null || identical(displayName, this.displayName)) &&
        (inAppUserName == null ||
            identical(inAppUserName, this.inAppUserName)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl)) &&
        (email == null || identical(email, this.email)) &&
        (bio == null || identical(bio, this.bio))) {
      return this;
    }

    return new User(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      bio: bio ?? this.bio,
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, displayName: $displayName, inAppUserName: $inAppUserName, photoUrl: $photoUrl, email: $email, bio: $bio}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          displayName == other.displayName &&
          inAppUserName == other.inAppUserName &&
          photoUrl == other.photoUrl &&
          email == other.email &&
          bio == other.bio);

  @override
  int get hashCode =>
      userId.hashCode ^
      displayName.hashCode ^
      inAppUserName.hashCode ^
      photoUrl.hashCode ^
      email.hashCode ^
      bio.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      userId: map['userId'] as String,
      displayName: map['displayName'] as String,
      inAppUserName: map['inAppUserName'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'displayName': this.displayName,
      'inAppUserName': this.inAppUserName,
      'photoUrl': this.photoUrl,
      'email': this.email,
      'bio': this.bio,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}