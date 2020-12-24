import 'package:flutter/material.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;
  PostUploadScreen({this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);

    if (!postViewModel.isImagePicked && !postViewModel.isProcessing){
      Future(() => postViewModel.pickImage(uploadType));
    }

    return Scaffold(
      body: Container(),
    );
  }
}
