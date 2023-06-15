import 'package:flutter/material.dart';

import 'theme_color.dart';

class AppTheme {
  static ThemeData _getThemeData({required ColorScheme colorScheme}) {
    return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.all(8.0),
      ),
      colorScheme: colorScheme,
    );
  }

  static final ThemeData scapedThemeDataLight = _getThemeData(colorScheme: ThemeColor.lightColorScheme);
  static final ThemeData scapedThemeDataDark = _getThemeData(colorScheme: ThemeColor.darkColorScheme);
}
