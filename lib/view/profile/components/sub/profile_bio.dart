import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/profile/screens/edit_profile_screen.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileBio extends StatelessWidget {
  final ProfileMode mode;

  ProfileBio({@required this.mode});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(profileUser.inAppUserName),
          Text(
            profileUser.bio,
            style: profileBioTextStyle,
          ),
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: double.infinity,
            child: _button(context, profileUser),
          )
        ],
      ),
    );
  }

  _button(BuildContext context, User profileUser) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final isFollowing = profileViewModel.isFollowingProfileUser;

    return RaisedButton(
      onPressed: () {
        mode == ProfileMode.MYSELF
            ? _openEditProfileScreen(context)
            : isFollowing
                ? _unFollow(context)
                : _follow(context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: mode == ProfileMode.MYSELF
          ? Text(S.of(context).editProfile)
          : isFollowing
              ? Text(S.of(context).unFollow)
              : Text(S.of(context).follow),
    );
  }

  _openEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditProfileScreen()),
    );
  }

  //todo フォローする
  _follow(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.follow();

  }

  //todo フォローをやめる
  _unFollow(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.unFollow();

  }
}
