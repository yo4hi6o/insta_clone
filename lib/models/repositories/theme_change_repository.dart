
import 'package:shared_preferences/shared_preferences.dart';

const PREF_KEY = "isDarkOn";

class ThemeChangeRepository {

  Future<void> setTheme(bool isDarkOn) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PREF_KEY, isDarkOn);

  }

}