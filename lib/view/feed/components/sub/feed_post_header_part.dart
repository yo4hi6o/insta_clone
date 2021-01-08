import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/common/components/user_card.dart';
import 'package:insta_clone/view/common/dialog/confirm_dialog.dart';
import 'package:insta_clone/view/feed/screens/feed_post_edit_screen.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class FeedPostHeaderPart extends StatelessWidget {
  final User postUser;
  final Post post;
  final User currentUser;
  final FeedMode feedMode;

  FeedPostHeaderPart({
    @required this.postUser,
    @required this.post,
    @required this.currentUser,
    @required this.feedMode,
  });

  @override
  Widget build(BuildContext context) {
    return UserCard(
      photoUrl: postUser.photoUrl,
      title: postUser.inAppUserName,
      subTitle: post.locationString,
      onTap: null,
      //todo
      trailing: PopupMenuButton(
        icon: Icon(Icons.more_vert),
        onSelected: (value) => onPopupMenuSelected(context, value),
        itemBuilder: (context) {
          if (postUser.userId == currentUser.userId) {
            return [
              PopupMenuItem(
                value: PostMenu.EDIT,
                child: Text(S.of(context).edit),
              ),
              PopupMenuItem(
                value: PostMenu.DELETE,
                child: Text(S.of(context).delete),
              ),
              PopupMenuItem(
                value: PostMenu.SHARE,
                child: Text(S.of(context).share),
              ),
            ];
          } else {
            return [
              PopupMenuItem(
                value: PostMenu.SHARE,
                child: Text(S.of(context).share),
              ),
            ];
          }
        },
      ),
    );
  }

  onPopupMenuSelected(BuildContext context, PostMenu selectedMenu) {
    switch (selectedMenu) {
      case PostMenu.EDIT:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FeedPostEditScreen(
              post: post,
              postUser: postUser,
              feedMode: feedMode,
            ),
          ),
        );
        break;
      case PostMenu.SHARE:
        Share.share(post.imageUrl, subject: post.caption);
        break;
      case PostMenu.DELETE:
        showConfirmDialog(
          context: context,
          title: S.of(context).deletePost,
          content: S.of(context).deleteCommentConfirm,
          onConfirmed: (isConfirmed) {
            if (isConfirmed) _deletePost(context, post);
          },
        );
    }
  }

  void _deletePost(BuildContext context, Post post) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.deletePost(post, feedMode);
  }
}
