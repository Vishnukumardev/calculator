import 'package:flutter/material.dart';

import '../Utils/colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: scaffoldLightColor,
  primaryColor: scaffoldLightColor,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
      surface: scaffoldLightColor,
      primary: scaffoldLightColor,
      secondary: scaffoldDarkColor),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: scaffoldDarkColor,
  primaryColor: scaffoldDarkColor,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
      surface: scaffoldDarkColor,
      primary: scaffoldDarkColor,
      secondary: scaffoldLightColor),
);
