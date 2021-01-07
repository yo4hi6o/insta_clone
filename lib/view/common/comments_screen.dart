import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/view/comments/components/comment_input_part.dart';
import 'package:insta_clone/view/comments/components/comments_display_part.dart';
import 'package:insta_clone/view/common/dialog/confirm_dialog.dart';
import 'package:insta_clone/view_models/comments_view_model.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  final Post post;
  final User postUser;

  CommentsScreen({@required this.post, @required this.postUser});

  @override
  Widget build(BuildContext context) {
    final commentsViewModel =
        Provider.of<CommentsViewModel>(context, listen: false);
    Future(() => commentsViewModel.getComments(post.postId));
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).comments),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //キャプション
              CommentsDisplayPart(
                postUserPhotoUrl: postUser.photoUrl,
                name: postUser.inAppUserName,
                text: post.caption,
                postDateTime: post.postDateTime,
              ),
              //コメントのリスト
              Consumer<CommentsViewModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.comments.length,
                    itemBuilder: (context, index) {
                      final comment = model.comments[index];
                      final commentUserId = comment.commentUserId;
                      return FutureBuilder(
                        future: model.getCommentUserInfo(commentUserId),
                        builder: (context, AsyncSnapshot<User> snapshot) {
                          if (snapshot.hasData) {
                            final commentUser = snapshot.data;
                            return CommentsDisplayPart(
                              postUserPhotoUrl: commentUser.photoUrl,
                              postDateTime: comment.commentDateTime,
                              name: commentUser.inAppUserName,
                              text: comment.comment,
                              onLongPressed: () => showConfirmDialog(
                                  context: context,
                                  title: S.of(context).deleteComment,
                                  content: S.of(context).deleteCommentConfirm,
                                  onConfirmed: (isConfirmed){
                                    if (isConfirmed){
                                      _deleteComment(context, index);
                                    }
                                  }),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    },
                  );
                },
              ),
              //todoコメント入力欄
              CommentInputPart(
                post: post,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteComment(BuildContext context, int commentIndex) async{
    final commentsViewModel =
    Provider.of<CommentsViewModel>(context, listen: false);
    await commentsViewModel.deleteComment(post, commentIndex);
  }
}
