import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/view/common/components/user_card.dart';

class FeedPostHeaderPart extends StatelessWidget {
  final User postUser;
  final Post post;
  final User currentUser;

  FeedPostHeaderPart({
    @required this.postUser,
    @required this.post,
    @required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return UserCard(
      photoUrl: postUser.photoUrl,
      title: postUser.photoUrl,
      subTitle: post.locationString,
      onTap: null,
      //todo
      trailing: null, //todo
    );
  }
}
