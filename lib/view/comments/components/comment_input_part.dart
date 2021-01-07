import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/common/components/circle_photo.dart';
import 'package:insta_clone/view_models/comments_view_model.dart';
import 'package:provider/provider.dart';

class CommentInputPart extends StatefulWidget {
  @override
  _CommentInputPartState createState() => _CommentInputPartState();
}

class _CommentInputPartState extends State<CommentInputPart> {
  final _commentInputController = TextEditingController();
  bool isCommentPostEnable = false;

  @override
  void initState() {
    _commentInputController.addListener(onCommentChanged);
    super.initState();

    @override
    void dispose() {
      _commentInputController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final commentsViewModel = Provider.of<CommentsViewModel>(context);
    final commenter = commentsViewModel.currentUser;

    return Card(
      color: cardColor,
      child: ListTile(
        leading: CirclePhoto(
          photoUrl: commenter.photoUrl,
          isImageFromFile: false,
        ),
        title: TextField(
          controller: _commentInputController,
          style: commentInputTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: S.of(context).addComment,
          ),
        ),
        trailing: FlatButton(
          onPressed: isCommentPostEnable ? () => _postComment(context) : null,
          child: Text(
            S.of(context).post,
            style: TextStyle(
              color: isCommentPostEnable ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void onCommentChanged() {
    final commentsViewModel =
        Provider.of<CommentsViewModel>(context, listen: false);
    commentsViewModel.comment = _commentInputController.text;
    print("Comments in ViewModel: ${commentsViewModel.comment}");

    setState(() {
      if (_commentInputController.text.length > 0) {
        isCommentPostEnable = true;
      } else {
        isCommentPostEnable = false;
      }
    });
  }

  //todo
  _postComment(BuildContext context) {}
}
