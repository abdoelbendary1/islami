import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String app_language = "en";
  ThemeMode app_theme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (app_language == newLanguage) {
      return;
    }
    app_language = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (app_theme == newMode) {
      return;
    }
    app_theme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return app_theme == ThemeMode.dark;
  }
}
