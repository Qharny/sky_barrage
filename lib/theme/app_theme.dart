import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF3B82F6); // Blue Accent
  static const Color secondaryColor = Color(0xFFF59E0B); // Amber/Orange Accent
  static const Color backgroundColor = Color(0xFF0F172A); // Dark Slate (Sky)
  static const Color surfaceColor = Color(0xFF1E293B); // Lighter Slate
  static const Color errorColor = Color(0xFFEF4444); // Red
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
        background: backgroundColor,
      ),
      useMaterial3: true,
      
      // Default font family
      fontFamily: 'Roboto', // We can update this once we import custom fonts
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textPrimary, fontSize: 48, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: textPrimary, fontSize: 36, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(color: textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: textPrimary, fontSize: 24, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: textPrimary, fontSize: 20, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: textPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: textSecondary, fontSize: 14),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
