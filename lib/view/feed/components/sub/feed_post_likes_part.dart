import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/data_models/like.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/common/comments_screen.dart';
import 'package:insta_clone/view/who_cares_me/screens/who_cares_me_screen.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/utils/constants.dart';

class FeedPostLikesPart extends StatelessWidget {
  final Post post;
  final User postUser;

  FeedPostLikesPart({@required this.post, @required this.postUser});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FutureBuilder(
        future: feedViewModel.getLikeResult(post.postId),
        builder: (context, AsyncSnapshot<LikeResult> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final likeResult = snapshot.data;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      likeResult.isLikedToThisPost
                          ? IconButton(
                              icon: FaIcon(FontAwesomeIcons.solidHeart),
                              onPressed: () => _unLikeIt(context),
                            )
                          : IconButton(
                              icon: FaIcon(FontAwesomeIcons.heart),
                              onPressed: () => _likeIt(context),
                            ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.comment),
                        //todo
                        onPressed: () =>
                            _openCommentsScreen(context, post, postUser),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _checkLikesUsers(context),
                    child: Text(
                      likeResult.likes.length.toString() +
                          " " +
                          S.of(context).likes,
                      style: numberOfLikesTextStyle,
                    ),
                  ),
                ]);
          } else {
            return Container();
          }
        },
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

  _likeIt(BuildContext context) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.likeIt(post);
  }

  _unLikeIt(BuildContext context) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.unLikeIt(post);
  }

  _checkLikesUsers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WhoCaresMeScreen(
          mode: WhoCaresMeMode.LIKE,
          id: post.postId,
        ),
      ),
    );
  }
}
