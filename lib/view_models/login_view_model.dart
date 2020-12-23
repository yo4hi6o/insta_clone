import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  LoginViewModel({this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;

  Future<bool> isSingIn() async{
    return await userRepository.isSignIn();
  }

  Future<void> signIn() async{
    isLoading = true;
    notifyListeners();

    isSuccessful = await userRepository.signIn();

    isLoading = false;
    notifyListeners();

  }
}