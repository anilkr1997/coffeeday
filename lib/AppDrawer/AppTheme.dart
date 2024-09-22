import 'package:flutter/material.dart';

class AppTheme {
  // Brown color palette
  static const Color primaryBrown = Color(0xFF795548);
  static const Color lightBrown = Color(0xFFD7CCC8);
  static const Color darkBrown = Color(0xFF5D4037);
  static const Color accentBrown = Color(0xFFBCAAA4);
  static const Color textBrown = Color(0xFF3E2723);

  static const Color backgroundColor = Color(0xFFF5F3F2);

  static ThemeData get brownTheme {
    return ThemeData(
      primaryColor: primaryBrown,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        color: primaryBrown,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: textBrown, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: textBrown),
        bodyMedium: TextStyle(color: textBrown),
      ),
      iconTheme: const IconThemeData(color: darkBrown),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: accentBrown,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: lightBrown,
        labelStyle: TextStyle(color: textBrown),
      ),
    );
  }
}