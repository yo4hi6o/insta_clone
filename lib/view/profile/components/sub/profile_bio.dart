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
          Text(profileUser.bio, style: profileBioTextStyle,),
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
    return RaisedButton(
      //todo
      onPressed: () => _openEditProfileScreen(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: mode == ProfileMode.MYSELF
          ? Text(S.of(context).editProfile)
          //todo
          : Text("フォローする"),
    );
  }

  _openEditProfileScreen(BuildContext context) {
    Navigator.push(
      context, MaterialPageRoute(builder: (_) => EditProfileScreen()
    ),
    );
  }
}
