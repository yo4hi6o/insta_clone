import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/common/components/user_card.dart';
import 'package:insta_clone/view/post/components/post_caption_part.dart';

class FeedPostEditScreen extends StatelessWidget {
  final Post post;
  final User postUser;
  final FeedMode feedMode;

  FeedPostEditScreen(
      {@required this.post, @required this.postUser, @required this.feedMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //todo
      ),
      body: Column(
        children: <Widget>[
          UserCard(
            photoUrl: postUser.photoUrl,
            title: postUser.inAppUserName,
            subTitle: post.locationString,
            onTap: null,
          ),
          PostCaptionPart(
            from: PostCaptionOpenMode.FROM_FEED,
          )
        ],
      ),
    );
  }
}
