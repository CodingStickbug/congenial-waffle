import 'package:flutter/material.dart';
import 'package:mymusic/theme/dark_mode.dart';
import 'package:mymusic/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initially, dark mode
  ThemeData _themeData = darkMode;

  // Get theme
  ThemeData get themeData => _themeData;

  // Check theme
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Update UI
    notifyListeners();
  }

  // Toggle theme method
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    }
    else {
     themeData = lightMode; 
    }
  }
}