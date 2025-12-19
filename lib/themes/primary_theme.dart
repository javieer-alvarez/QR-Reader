import 'package:flutter/material.dart';

class PrimaryTheme {
  static Color primary = Colors.teal.shade900;
  static const Color secondary = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primary),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: secondary)));
}
