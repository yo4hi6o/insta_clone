import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/feed/components/sub/feed_post_comments_part.dart';
import 'package:insta_clone/view/feed/components/sub/feed_post_header_part.dart';
import 'package:insta_clone/view/feed/components/sub/feed_post_likes_part.dart';
import 'package:insta_clone/view/feed/components/sub/image_from_url.dart';

class FeedPostTile extends StatelessWidget {
  final FeedMode feedMode;
  final Post post;

  FeedPostTile({this.feedMode, this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FeedPostHeaderPart(),
          ImageFromUrl(
            imageUrl: post.imageUrl,
          ),
          FeedPostLikesPart(),
          FeedPostCommentsPart(),
        ],
      ),
    );
  }
}
