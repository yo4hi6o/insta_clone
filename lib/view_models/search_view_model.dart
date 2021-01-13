import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  SearchViewModel({this.userRepository});

  List<User> soughtUsers = List();

  Future<void> searchUsers(String query) async{
    soughtUsers=  await userRepository.searchUser(query);
  }

}