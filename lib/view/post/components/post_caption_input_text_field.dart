import 'package:flutter/material.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostCaptionInputTextField extends StatefulWidget {
  @override
  _PostCaptionInputTextFieldState createState() => _PostCaptionInputTextFieldState();
}

class _PostCaptionInputTextFieldState extends State<PostCaptionInputTextField> {
  final _captionController = TextEditingController();

  @override
  void initState() {
    _captionController.addListener(_onCaptionUpdated) ;
    super.initState();
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _captionController,
    );
  }

  _onCaptionUpdated(){
    final viewModel = Provider.of<PostViewModel>(context, listen: false);
    viewModel.caption = _captionController.text;
    print("caption: ${viewModel.caption}");

  }
}
