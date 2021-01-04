import 'package:flutter/material.dart';
import 'package:insta_clone/style.dart';

class CommentRichText extends StatefulWidget {
  final String name;
  final String text;

  CommentRichText({@required this.name, @required this.text});
  @override
  _CommentRichTextState createState() => _CommentRichTextState();
}

class _CommentRichTextState extends State<CommentRichText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: widget.name,
              style: commentNameTextStyle,
            ),
            TextSpan(text: " "),
            TextSpan(
              text: widget.text,
              style: commentContentTextStyle,
            )
          ]

        ));
  }
}
