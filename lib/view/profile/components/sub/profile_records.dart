import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';

class ProfileRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _userRecordWidget(
          context: context,
          score: 11,
          title: S.of(context).post,
        ),
        _userRecordWidget(
          context: context,
          score: 1,
          title: S.of(context).followers,
        ),
        _userRecordWidget(
          context: context,
          score: 3,
          title: S.of(context).followings,
        ),
      ],
    );
  }

  _userRecordWidget({BuildContext context, int score, String title}) {
    return Expanded(
      flex: 1,
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
    );
  }
}
