import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/common/components/circle_photo.dart';
import 'package:insta_clone/view/common/dialog/confirm_dialog.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _photoUrl = "";
  bool _isImageFromFile = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    _isImageFromFile = false;
    _photoUrl = profileUser.photoUrl;

    _nameController.text = profileUser.inAppUserName;
    _bioController.text = profileUser.bio;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(S.of(context).editProfile),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => showConfirmDialog(
              context: context,
              title: S.of(context).editProfile,
              content: S.of(context).editProfileConfirm,
              onConfirmed: (isConfirmed) {
                if (isConfirmed) {
                  _updateProfile(context);
                }
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: CirclePhoto(
                  radius: 60.0,
                  photoUrl: _photoUrl,
                  isImageFromFile: _isImageFromFile,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: InkWell(
                  onTap: () => _pickNewProfileImage(),
                  child: Text(
                    S.of(context).changeProfilePhoto,
                    style: changeProfilePhotoTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Name",
                style: editProfileTitleTextStyle,
              ),
              TextField(
                controller: _nameController,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Bio",
                style: editProfileTitleTextStyle,
              ),
              TextField(
                controller: _bioController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickNewProfileImage() async {
    _isImageFromFile = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    _photoUrl = await profileViewModel.pickProfileImage();
    setState(() {
      _isImageFromFile = true;
    });
  }

  void _updateProfile(BuildContext context) async {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.updateProfile(
      _nameController.text,
      _bioController.text,
      _photoUrl,
      _isImageFromFile
    );

    Navigator.pop(context);
  }
}
