import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/comments.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/utils/functions.dart';
import 'package:insta_clone/view/common/comments_screen.dart';
import 'package:insta_clone/view/feed/components/comment_rich_text.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';

class FeedPostCommentsPart extends StatelessWidget {
  final Post post;
  final User postUser;

  FeedPostCommentsPart({@required this.post, @required this.postUser});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 投稿者名とキャプション
          CommentRichText(
            name: postUser.inAppUserName,
            text: post.caption,
          ),
          InkWell(
            //todo
            onTap: () => _openCommentsScreen(
              context,
              post,
              postUser,
            ),
            child: FutureBuilder(
              future: feedViewModel.getComments(post.postId),
              builder: (context, AsyncSnapshot<List<Comment>> snapshot){
                if (snapshot.hasData && snapshot.data != null){
                  final comments = snapshot.data;
                  return Text(
                    comments.length.toString() + " " + S.of(context).comments,
                    style: numberOfCommentsTextStyle,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Text(
            createTimeAgoString(post.postDateTime),
            style: timeAgoTextStyle,
          ),
        ],
      ),
    );
  }

  _openCommentsScreen(BuildContext context, Post post, User postUser) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommentsScreen(
          post: post,
          postUser: postUser,
        ),
      ),
    );
  }
}
