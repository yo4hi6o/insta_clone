import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  LoginViewModel({this.userRepository});

  Future<bool> isSingIn() async{
    return await userRepository.isSignIn();
  }
}