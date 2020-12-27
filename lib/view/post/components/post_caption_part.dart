import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/post/components/post_caption_input_text_field.dart';
import 'package:insta_clone/view/post/pages/screens/enlarge_image_screen.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

import 'hero_image.dart';

class PostCaptionPart extends StatelessWidget {
  final PostCaptionOpenMode from;

  PostCaptionPart({@required this.from});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);
    final image = Image.file(postViewModel.imageFile);

    if (from == PostCaptionOpenMode.FROM_POST) {
      return ListTile(
        leading: HeroImage(
          image: image,
          onTap: () => _displayLargeImage(context, image),
        ),
        title: PostCaptionInputTextField(),
      );
    } else {
      //todo
      return Container();
    }
  }

  _displayLargeImage(BuildContext context, Image image) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => EnlargeImageScreen(
                image: image,
              )),
    );
  }
}
