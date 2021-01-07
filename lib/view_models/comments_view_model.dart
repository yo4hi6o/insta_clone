import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/comments.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class CommentsViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  User get currentUser => UserRepository.currentUser;

  String comment = "";

  List<Comment> comments = List();

  bool  isLoading = false;

  CommentsViewModel({this.userRepository, this.postRepository});

  Future<void> postComment(Post post) async{
    await postRepository.postComment(post, currentUser, comment);
    getComments(post.postId);
    notifyListeners();
  }

  Future<void> getComments(String postId) async {
    isLoading = true;
    notifyListeners();

    comments = await postRepository.getComments(postId);
    print("comments from DB: $comments");

    isLoading = false;
    notifyListeners();

  }

  Future<User> getCommentUserInfo(String commentUserId) async {
    return await userRepository.getUserById(commentUserId);
  }

  Future<void> deleteComment(Post post, int commentIndex) async{
    final deleteCommentId = comments[commentIndex].commentId;
    await postRepository.deleteComment(deleteCommentId);
    getComments(post.postId);
    notifyListeners();
  }

}