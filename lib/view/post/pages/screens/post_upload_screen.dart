import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/common/dialog/confirm_dialog.dart';
import 'package:insta_clone/view/post/components/post_caption_part.dart';
import 'package:insta_clone/view/post/components/post_location_part.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;

  PostUploadScreen({this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);

    if (!postViewModel.isImagePicked && !postViewModel.isProcessing) {
      Future(() => postViewModel.pickImage(uploadType));
    }

    return Consumer<PostViewModel>(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              leading: model.isProcessing
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => _cancelPost(context),
                    ),
              title: model.isProcessing
                  ? Text(S.of(context).underProcessing)
                  : Text(S.of(context).post),
              actions: <Widget>[
                (model.isProcessing || !model.isImagePicked)
                    ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => _cancelPost(context),
                      )
                    : IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () => showConfirmDialog(
                            context: context,
                            title: S.of(context).post,
                            content: S.of(context).postConfirm,
                            onConfirmed: (isConfirmed){
                          if (isConfirmed){
                            _post(context);
                }
                },
                      ),
                )
              ],
            ),
            body: model.isProcessing
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : model.isImagePicked
                    ? Column(
                        children: <Widget>[
                          Divider(),
                          PostCaptionPart(
                            from: PostCaptionOpenMode.FROM_POST,
                          ),
                          Divider(),
                          PostLocationPart(),
                          Divider(),
                        ],
                      )
                    : Container());
      },
    );
  }

//todo
  _cancelPost(BuildContext context) async {
    //todo viewmodel#cancelPost
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    await postViewModel.cancelPost();

    Navigator.pop(context);
  }

  void _post(BuildContext context) async{print("postUploadScreen# _post invoked");
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    await postViewModel.post();
    Navigator.pop(context);
  }
}
