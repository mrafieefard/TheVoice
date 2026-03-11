import 'package:flutter/material.dart';

final primary = const Color.fromARGB(255, 247, 169, 112);
final secondary = const Color.fromARGB(255, 10, 122, 162);
final textColor = const Color.fromARGB(255, 252, 228, 210);
final accentColor = const Color.fromARGB(255, 90, 62, 244);
final backgroundColor = const Color.fromARGB(255, 25, 12, 2);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.black,
    secondary: secondary,
    onSecondary: textColor,
    error: Colors.red,
    onError: Colors.white,
    background: backgroundColor,
    onBackground: textColor,
    surface: backgroundColor,
    onSurface: textColor,
  ),

  scaffoldBackgroundColor: backgroundColor,

  appBarTheme: AppBarTheme(
    backgroundColor: primary,
    foregroundColor: textColor,
    elevation: 0,
    centerTitle: true,
  ),

  textTheme: const TextTheme().apply(
    bodyColor: textColor,
    displayColor: textColor,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: accentColor,
    foregroundColor: Colors.white,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: secondary, width: 2),
    ),
  ),

  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
