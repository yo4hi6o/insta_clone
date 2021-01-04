import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insta_clone/di/providers.dart';
import 'package:insta_clone/view/login/screens/home_screen.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/login/screens/login_screen.dart';
import 'package:insta_clone/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

import 'package:timeago/timeago.dart' as timeAgo;

void main() async {

  timeAgo.setLocaleMessages("ja", timeAgo.JaMessages());

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
      MultiProvider(
        providers: globalProviders,
        child: MyApp(),
      )
      );
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return MaterialApp(
      title: "Instagram",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      theme: ThemeData(
        brightness: Brightness.dark,
        buttonColor: Colors.white30,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        fontFamily: RegularFont,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSingIn(),
        builder: (context, AsyncSnapshot<bool>snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
