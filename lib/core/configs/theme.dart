import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(48, 132, 254, 1),
        secondary: Color.fromRGBO(233, 236, 245, 1),
      ),
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
