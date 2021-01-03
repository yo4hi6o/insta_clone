import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/common/components/button_with_icon.dart';
import 'package:insta_clone/view/login/screens/home_screen.dart';
import 'package:insta_clone/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).appTitle,
                        style: loginTitleTextStyle,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      ButtonWithIcon(
                        iconData: FontAwesomeIcons.signInAlt,
                        label: S.of(context).signIn,
                        onPressed: () => login(context),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    await loginViewModel.signIn();
    if (!loginViewModel.isSuccessful) {
      Fluttertoast.showToast(msg: S.of(context).signInFailed);
      return;
    }
    _openHomeScreen(context);
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
