import 'package:flutter/material.dart';
import 'package:my_architecture/themes/color_codes.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: ThemeColor.lightModeColor,
    primaryColor: ThemeColor.darkModeColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: ThemeColor.darkModeColor),
      headline6: TextStyle(fontSize: 14.0, color: Colors.black54),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: ThemeColor.darkModeColor,
    primaryColor: ThemeColor.lightModeColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: ThemeColor.lightModeColor),
      headline6: TextStyle(fontSize: 14.0, color: Colors.white54),
    ),
  );
}
