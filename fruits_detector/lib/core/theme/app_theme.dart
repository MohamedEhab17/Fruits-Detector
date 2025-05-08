import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.black87),
      titleSmall: TextStyle(fontSize: 20, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
    cardColor: Colors.black87,
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black87,
      textColor: Colors.black87,
    ),
    shadowColor: Colors.black54,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Color.fromARGB(255, 9, 3, 27),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 9, 3, 27),
      foregroundColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.white70),
      titleSmall: TextStyle(fontSize: 20, color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    ),
    cardColor: Colors.white,
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white70,
    ),
    shadowColor: Colors.white54,
  );
}
