import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/theme_change_repository.dart';

class ThemeChangeViewModel extends ChangeNotifier {
  final ThemeChangeRepository repository;
  ThemeChangeViewModel({this.repository});
}