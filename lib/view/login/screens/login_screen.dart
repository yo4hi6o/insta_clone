import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/login/common/compponents/button_with_icon.dart';
import 'package:insta_clone/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).appTitle,
              style: loginTitleTextStyle,
            ),
            SizedBox(height: 8.0,),
            ButtonWithIcon(
              iconData: FontAwesomeIcons.signInAlt,
              label: S.of(context).signIn,
              onPressed: () => login(context),

            ),
          ],
        ),
      ),
    );
  }

  login(BuildContext context) async{
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    await loginViewModel.signIn();
    //todo
  }
}
