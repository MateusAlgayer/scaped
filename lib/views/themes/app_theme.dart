import 'package:flutter/material.dart';

import 'theme_color.dart';

enum ApplicationTheme { dark, light }

class AppTheme {
  final ValueNotifier<ApplicationTheme> _themeNotifier = ValueNotifier<ApplicationTheme>(ApplicationTheme.light);
  ThemeData _theme = _getThemeData(colorScheme: ThemeColor.lightColorScheme);
  AppTheme();

  void setTheme(ApplicationTheme theme) {
    ColorScheme colorScheme;

    if (themeNotifier.value == theme) {
      return;
    }

    switch (theme) {
      case ApplicationTheme.dark:
        colorScheme = ThemeColor.darkColorScheme;
      case ApplicationTheme.light:
        colorScheme = ThemeColor.lightColorScheme;
    }

    _theme = _getThemeData(colorScheme: colorScheme);
    themeNotifier.value = theme;
  }

  static ThemeData _getThemeData({required ColorScheme colorScheme}) {
    return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.all(8.0),
      ),
      colorScheme: colorScheme,
    );
  }

  ThemeData get theme => _theme;
  ValueNotifier<ApplicationTheme> get themeNotifier => _themeNotifier;
}
