import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/feed/components/sub/image_from_url.dart';
import 'package:insta_clone/view/feed/screens/feed_screen.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePostsGridPart extends StatelessWidget {
  final List<Post> posts;

  ProfilePostsGridPart({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      children: posts.isEmpty
          ? [Container()]
          : List.generate(
              posts.length,
              (int index) => InkWell(
                onTap: () => _openFeedScreen(context, index),
                child: ImageFromUrl(
                  imageUrl: posts[index].imageUrl,
                ),
              ),
            ),
    );
  }

  _openFeedScreen(BuildContext context, int index) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final feedUser = profileViewModel.profileUser;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FeedScreen(
          feedUser: feedUser,
          index: index,
          feedMode: FeedMode.FROM_PROFILE,
        ),
      ),
    );
  }
}
