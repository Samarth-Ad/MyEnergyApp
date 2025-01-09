import 'package:flutter/material.dart';

ThemeData lightMode =ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.orange.shade400,
    secondary: Colors.orange.shade300,
    tertiary: Colors.black
  )
);

ThemeData darkMode =ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(

    surface: Colors.grey.shade800,
    primary: Colors.yellow.shade900,
    secondary: Colors.orangeAccent.shade200,
    tertiary: Colors.white
  )
);