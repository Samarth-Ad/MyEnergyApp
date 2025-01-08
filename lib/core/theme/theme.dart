// import 'package:energy_monitoring_app/core/theme/app_pallet.dart';
// import 'package:flutter/material.dart';

// class AppTheme {
//   static final lightThemeMode = ThemeData.light().copyWith(
//     scaffoldBackgroundColor:  AppPalette.backgroundColor,

//   );
// }





import 'package:flutter/material.dart';

class AppTheme {
  // Define the Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppPalette.primaryColor,
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.primaryColor,
        foregroundColor: AppPalette.secondaryColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPalette.inputFieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppPalette.inputFieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppPalette.primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppPalette.secondaryColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppPalette.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: AppPalette.secondaryColor),
        labelLarge: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: AppPalette.secondaryColor),
    );
  }
}

// Define the AppPalette class for colors
class AppPalette {
  static const Color primaryColor = Color(0xFFFFC107); // Yellow (Sign Up button)
  static const Color secondaryColor = Color(0xFF2D2E50); // Dark blue for text/icons
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light gray/white for the background
  static const Color inputFieldBackground = Color(0xFFECEFF1); // Light gray for input fields
  static const Color inputFieldBorder = Color(0xFFB0BEC5); // Gray for input field borders
}
