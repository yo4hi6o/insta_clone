import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;
  ProfileViewModel({this.userRepository, this.postRepository});
}