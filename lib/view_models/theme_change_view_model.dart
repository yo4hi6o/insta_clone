import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/theme_change_repository.dart';
import 'package:insta_clone/style.dart';

class ThemeChangeViewModel extends ChangeNotifier {
  final ThemeChangeRepository repository;
  ThemeChangeViewModel({this.repository});

  bool isDarkOn = true;

  ThemeData get selectedTheme => isDarkOn ? darkTheme : lightTheme;

  void setTheme(bool isDark) async {
    await repository.setTheme(isDark);
    isDarkOn = isDark;
    notifyListeners();
  }
}