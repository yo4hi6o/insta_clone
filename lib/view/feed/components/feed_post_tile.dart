import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/utils/constants.dart';

class FeedPostTile extends StatelessWidget {
  final FeedMode feedMode;
  final Post post;
  
  FeedPostTile({this.feedMode, this.post});
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Image.network(post.imageUrl),
    ));
  }
}
