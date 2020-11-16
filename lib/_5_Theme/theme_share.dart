import 'package:flutter/material.dart';

class MJShareTheme {
  static const double smallFontSize = 20;
  static const double normalFontSize = 20;

  static final Color normalColor = Colors.red;
  static final Color dartTextColor = Colors.blue;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalFontSize, color: normalColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalFontSize, color: dartTextColor),
    ),
  );
}
