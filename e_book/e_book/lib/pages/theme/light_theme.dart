import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0.0,
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF3CA9FC),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFA8C1D2).withOpacity(0.25),
    tertiary: const Color(0xFFEE4667),
    inversePrimary: Colors.grey[600],
    inverseSurface: Colors.grey[200],
    onInverseSurface: Colors.grey[100],
    surfaceContainer: Colors.grey[300],
  ),
);
