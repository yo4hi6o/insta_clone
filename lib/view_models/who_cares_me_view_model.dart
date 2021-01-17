import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/who_cares_me/screens/who_cares_me_screen.dart';

class WhoCaresMeViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  WhoCaresMeViewModel({this.userRepository});

  List<User> caresMeUsers = List();

  Future <void> getCaresMeUsers(String id, WhoCaresMeMode mode) async{
    caresMeUsers = await userRepository.getCaresMeUsers(id,mode);
    print("who cares me: $caresMeUsers");
    notifyListeners();
  }
}