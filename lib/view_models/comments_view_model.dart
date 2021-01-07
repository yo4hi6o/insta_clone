import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class CommentsViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  User get currentUser => UserRepository.currentUser;

  String comment = "";

  CommentsViewModel({this.userRepository, this.postRepository});

  Future<void> postComment(Post post) async{
    await postRepository.postComment(post, currentUser, comment);
    notifyListeners();
  }

}