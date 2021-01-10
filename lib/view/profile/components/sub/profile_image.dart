import 'package:flutter/material.dart';
import 'package:insta_clone/view/common/components/circle_photo.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    return CirclePhoto(
      photoUrl: profileUser.photoUrl,
      isImageFromFile: false,
      radius: 30.0,
    );
  }
}
