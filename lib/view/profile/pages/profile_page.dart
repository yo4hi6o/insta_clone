import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  final ProfileMode profileMode;
  final User selectedUser;

  ProfilePage({@required this.profileMode, this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ProfilePage"),
      ),
    );
  }
}