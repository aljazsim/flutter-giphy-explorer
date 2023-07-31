import "package:flutter/material.dart";

abstract class Theme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        accentColor: Colors.grey[800],
        brightness: Brightness.dark,
      ),
    );
  }
}
