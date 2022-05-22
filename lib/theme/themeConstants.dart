import 'package:flutter/material.dart';

const colorSeed = 0xff3EB489;

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: const Color(colorSeed),
  brightness: Brightness.light,
  useMaterial3: true,
);
ThemeData darkTheme = ThemeData(
  colorSchemeSeed: const Color(colorSeed),
  brightness: Brightness.dark,
  useMaterial3: true,
);
