import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/who_cares_me/screens/who_cares_me_screen.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    return Row(
      children: <Widget>[
        FutureBuilder(
          future: profileViewModel.getNumberOfPosts(),
          builder: (context, AsyncSnapshot<int> snapshot) {
            return _userRecordWidget(
              context: context,
              score: snapshot.hasData ? snapshot.data : 0,
              title: S.of(context).post,
            );
          },
        ),
        FutureBuilder(
          future: profileViewModel.getNumberOfFollowers(),
          builder: (context, AsyncSnapshot<int> snapshot) {
            return _userRecordWidget(
              context: context,
              score: snapshot.hasData ? snapshot.data : 0,
              title: S.of(context).followers,
              whoCaresMeMode: WhoCaresMeMode.FOLLOWED,
            );
          },
        ),
        FutureBuilder(
            future: profileViewModel.getNumberOfFollowings(),
            builder: (context, AsyncSnapshot<int> snapshot) {
              return _userRecordWidget(
                context: context,
                score: snapshot.hasData ? snapshot.data : 0,
                title: S.of(context).followings,
                whoCaresMeMode: WhoCaresMeMode.FOLLOWINGS,
              );
            }),
      ],
    );
  }

  _userRecordWidget(
      {BuildContext context,
      int score,
      String title,
      WhoCaresMeMode whoCaresMeMode}) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: whoCaresMeMode == null
            ? null
            : () => _checkFollowUsers(context, whoCaresMeMode),
        child: Column(
          children: <Widget>[
            Text(
              score.toString(),
              style: profileRecordScoreTextStyle,
            ),
            Text(
              title.toString(),
              style: profileRecordTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  _checkFollowUsers(BuildContext context, WhoCaresMeMode whoCaresMeMode) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WhoCaresMeScreen(
          mode: whoCaresMeMode,
          id: profileUser.userId,
        ),
      ),
    );
  }
}
