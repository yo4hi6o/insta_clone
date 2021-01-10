import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/feed/components/feed_post_tile.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FeedSubPage extends StatelessWidget {
  final FeedMode feedMode;
  final User feedUser;
  final int index;

  FeedSubPage({@required this.feedMode, this.feedUser, @required this.index});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    feedViewModel.setFeedUser(feedMode, feedUser);

    Future(() => feedViewModel.getPosts(feedMode));

    return Consumer<FeedViewModel>(
      builder: (context, model, child) {
        if (model.isProcessing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () => feedViewModel.getPosts(feedMode),
            child: ScrollablePositionedList.builder(
              initialScrollIndex: index,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: model.posts.length,
              itemBuilder: (context, index) {
                return FeedPostTile(
                  feedMode: feedMode,
                  post: model.posts[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
