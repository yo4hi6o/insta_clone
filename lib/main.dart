import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insta_clone/di/providers.dart';
import 'package:insta_clone/models/repositories/theme_change_repository.dart';
import 'package:insta_clone/view/search/pages/home_screen.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/login/screens/login_screen.dart';
import 'package:insta_clone/view_models/login_view_model.dart';
import 'package:insta_clone/view_models/theme_change_view_model.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

import 'package:timeago/timeago.dart' as timeAgo;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final themeChangeRepository = ThemeChangeRepository();
  await themeChangeRepository.getIsDarkOn();

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
    final themeChangeViewModel = Provider.of<ThemeChangeViewModel>(context);

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

      theme: themeChangeViewModel.selectedTheme,
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
