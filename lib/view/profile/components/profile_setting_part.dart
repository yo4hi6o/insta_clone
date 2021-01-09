import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';

class ProfileSettingPart extends StatelessWidget {
  final ProfileMode mode;
  ProfileSettingPart({@required this.mode});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.settings),
      onSelected: (value) => _onPopupMenuSelected(context, value),
      itemBuilder: (context){
        if (mode == ProfileMode.MYSELF) {
          return [
            PopupMenuItem(
              value: ProfileSettingMenu.THEME_CHANGE,
              child: Text(S.of(context).changeToLightTheme),
            ),
            PopupMenuItem(
              value: ProfileSettingMenu.SIGN_OUT,
              child: Text(S.of(context).signOut),
            ),
          ];
        } else {
          return[
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
  _onPopupMenuSelected(BuildContext context, value) {}
}
