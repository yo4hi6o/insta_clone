import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';
import 'package:insta_clone/utils/constants.dart';

class FeedViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  String caption = "";

  FeedViewModel({this.userRepository, this.postRepository});

  bool isProcessing = false;
  List<Post> posts = List();

  User feedUser;
  User get currentUser => UserRepository.currentUser;

  void setFeedUser(FeedMode feedMode, User user){
    if (feedMode == FeedMode.FROM_FEED){
      feedUser = currentUser;
    }else {
      feedUser = user;
    }
  }

  Future<void> getPosts(FeedMode feedMode) async{
    isProcessing = true;
    notifyListeners();

    posts = await postRepository.getPosts(feedMode, feedUser);

    isProcessing = false;
    notifyListeners();

  }

  Future<User> getPostUserInfo(String userId) async{
    return await userRepository.getUserById(userId);
  }


}