import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/common/components/user_card.dart';
import 'package:insta_clone/view/common/dialog/confirm_dialog.dart';
import 'package:insta_clone/view/post/components/post_caption_part.dart';
import 'package:insta_clone/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';

class FeedPostEditScreen extends StatelessWidget {
  final Post post;
  final User postUser;
  final FeedMode feedMode;

  FeedPostEditScreen(
      {@required this.post, @required this.postUser, @required this.feedMode});

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedViewModel>(
      builder: (_, model, child) {
        return Scaffold(
          appBar: AppBar(
              leading: model.isProcessing
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
              title: model.isProcessing
                  ? Text(S.of(context).underProcessing)
                  : Text(S.of(context).editInfo),
              actions: <Widget>[
                model.isProcessing
                    ? Container()
                    : IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () => showConfirmDialog(
                          context: context,
                          title: S.of(context).editPost,
                          content: S.of(context).editPostConfirm,
                          onConfirmed: (isConfirmed) {
                            if (isConfirmed) {}
                            _updatePost(context);
                          },
                        ),
                      )
              ]),
          body: model.isProcessing
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      UserCard(
                        photoUrl: postUser.photoUrl,
                        title: postUser.inAppUserName,
                        subTitle: post.locationString,
                        onTap: null,
                      ),
                      PostCaptionPart(
                        from: PostCaptionOpenMode.FROM_FEED,
                        post: post,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  void _updatePost(BuildContext context) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.updatePost(post, feedMode);
    Navigator.pop(context);
  }
}
