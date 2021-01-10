import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/feed/pages/sub/feed_sub_page.dart';

class FeedScreen extends StatelessWidget {
  final User feedUser;
  final int index;
  final FeedMode feedMode;

  FeedScreen({@required this.feedUser, @required this.index, @required this.feedMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).post),
      ),
      body: FeedSubPage(
        feedMode: feedMode,
        feedUser: feedUser,
        index: index,
      ),
    );
  }
}
