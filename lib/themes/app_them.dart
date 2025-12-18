import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF00C2A8);

  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF4F7FA),
    primaryColor: primary,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF0B1220),
    primaryColor: primary,
  );
}
