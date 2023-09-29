import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(48, 132, 254, 1),
        secondary: Color.fromRGBO(251, 215, 162, 1),
      ),
      textTheme: textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
      ),
      buttonTheme: const ButtonThemeData(
        height: 45,
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme.light(
          primary: Color.fromRGBO(48, 132, 254, 1),
          secondary: Colors.white,
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
    );

TextTheme textTheme = const TextTheme(
  headlineLarge:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, wordSpacing: 1.5),
);
