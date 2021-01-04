import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/feed/components/comment_rich_text.dart';

class FeedPostCommentsPart extends StatelessWidget {
  final Post post;
  final User postUser;


  FeedPostCommentsPart({@required this.post, @required this.postUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          // 投稿者名とキャプション
          CommentRichText(
            name: postUser.inAppUserName,
            text: post.caption,
          ),
          InkWell(
            //todo
            onTap: null,
              child: Text(
                "0 ${S.of(context).comments}", style: numberOfCommentsTextStyle,
              ),
          ),
          Text("○時間前", style: timeAgoTextStyle,
          ),
        ],
      ),
    );
  }
}
