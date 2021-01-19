import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view/login/screens/login_screen.dart';
import 'package:insta_clone/view_models/profile_view_model.dart';
import 'package:insta_clone/view_models/theme_change_view_model.dart';
import 'package:provider/provider.dart';

class ProfileSettingPart extends StatelessWidget {
  final ProfileMode mode;

  ProfileSettingPart({@required this.mode});

  @override
  Widget build(BuildContext context) {
    final themeChangeViewModel =
        Provider.of<ThemeChangeViewModel>(context);
    final isDarkOn = themeChangeViewModel.isDarkOn;

    return PopupMenuButton(
      icon: Icon(Icons.settings),
      onSelected: (value) => _onPopupMenuSelected(context, value, isDarkOn),
      itemBuilder: (context) {
        if (mode == ProfileMode.MYSELF) {
          return [
            PopupMenuItem(
              value: ProfileSettingMenu.THEME_CHANGE,
              child: isDarkOn
                  ? Text(S.of(context).changeToLightTheme)
                  : Text(S.of(context).changeToDarkTheme),
            ),
            PopupMenuItem(
              value: ProfileSettingMenu.SIGN_OUT,
              child: Text(S.of(context).signOut),
            ),
          ];
        } else {
          return [
            PopupMenuItem(
              value: ProfileSettingMenu.THEME_CHANGE,
              child: Text(S.of(context).changeToLightTheme),
            ),
          ];
        }
      },
    );
  }

  //todo
  _onPopupMenuSelected(BuildContext context, ProfileSettingMenu selectedMenu, bool isDarkOn) {
    switch (selectedMenu) {
      case ProfileSettingMenu.THEME_CHANGE:
        final themeChangeViewModel =
            Provider.of<ThemeChangeViewModel>(context, listen: false);
        themeChangeViewModel.setTheme(!isDarkOn);
        break;
      case ProfileSettingMenu.SIGN_OUT:
        _signOut(context);
        break;
    }
  }

  void _signOut(BuildContext context) async {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    await profileViewModel.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
