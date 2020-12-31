import 'package:flutter/material.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';

class FeedSubPage extends StatelessWidget {
  final FeedMode feedMode;

  FeedSubPage({@required this.feedMode});
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of <FeedViewModel> (context, listen: false);
    //todo　プロフィール画面から来た場合はUserの設定要る
    feedViewModel.setFeedUser(feedMode, null);

    Future(() => feedViewModel.getPosts(feedMode));

    return Scaffold(
      body: Center(
        child: Text("FeedSubPage"),
      ),
    );
  }
}

