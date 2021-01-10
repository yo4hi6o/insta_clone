import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/post.dart';
import 'package:insta_clone/view/feed/components/sub/image_from_url.dart';

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
              (index) => ImageFromUrl(
                imageUrl: posts[index].imageUrl,
              ),
            ),
    );
  }
}
