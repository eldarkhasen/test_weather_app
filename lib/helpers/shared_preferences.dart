import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_weather/constants/language.dart';

class SharedPreferencesHelper{
  static const String _languageKey = "language";
  static Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? Language.getDefaultLanguage();
  }
}