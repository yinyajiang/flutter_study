import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get isDarkMode => _themeData == darkMode;
  ThemeData get lightTheme => lightMode;
  ThemeData get darkTheme => darkMode;

  void toggleTheme() {
    themeData = isDarkMode ? lightMode : darkMode;
  }
}
