import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/feed/pages/sub/feed_sub_page.dart';
import 'package:insta_clone/view/post/pages/screens/post_upload_screen.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.cameraRetro),
          onPressed: () => _launchCamera(context),
        ),title: Text(
        S.of(context).appTitle,style: TextStyle(fontFamily: TitleFont),
      ),
      ),
      body: FeedSubPage(
        feedMode: FeedMode.FROM_FEED,
      )
    );
  }

  _launchCamera(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostUploadScreen(
          uploadType: UploadType.CAMERA,
        ),
      ),
    );
  }
}
