import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    final query = await _db
        .collection("user")
        .where("userId", isEqualTo: firebaseUser.uid)
        .get();
    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async {
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<User> getUserInfoFromDbById(String userId) async {
    final query =
        await _db.collection("users").where("userId", isEqualTo: userId).get();
    return User.fromMap(query.docs[0].data());
  }

  Future <String> uploadImageToStorage(File imageFile, String storageId) async{
    final storageRef = FirebaseStorage.instance.ref().child(storageId);
    final uploadTask = storageRef.putFile(imageFile);
    return await(await uploadTask.onComplete).ref.getDownloadURL();
  }

  Future<void> insertPost(Post post) async{
    await _db.collection("posts").doc(post.postId).set(post.toMap());
  }

  Future<List<Post>> getPostMineAndFollowings(String userId) async{
    //データの有無を判定
    final query = await _db.collection("posts").get();
    if (query.docs.length == 0) return List();

    var userIds = await getFollowingUserIds(userId);
    userIds.add(userId);


  }

  Future <List<String>> getFollowingUserIds(String userId) async{
    final query = await _db.collection("users").doc(userId).collection("followings").get();
    if (query.docs.length == 0) return List();

    var userIds = List<String>();
    query.docs.forEach((id) {
      userIds.add(id.data()["userId"]);
    });
    return userIds;
  }

  //todo
  //Future<List<Post>> getPostsByUser(String userId) {}
}
