import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProviderState with ChangeNotifier {
  //theme

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }

  bool get isDarkMode => _themeData == darkMode;

  //calculatestate

  String _displayText = '0';

  String get displayText => _displayText;

  void updateDisplay(String value) {
    _displayText = value;
    notifyListeners();
  }

  void clearDisply() {
    _displayText = '0';
    notifyListeners();
  }
}
