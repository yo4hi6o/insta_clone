import 'package:flutter/material.dart';
import 'package:insta_clone/utils/constants.dart';

class FeedSubPage extends StatelessWidget {
  final FeedMode feedMode;

  FeedSubPage({@required this.feedMode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("FeedSubPage"),
      ),
    );
  }
}

