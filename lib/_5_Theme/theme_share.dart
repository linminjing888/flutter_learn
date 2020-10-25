import 'package:flutter/material.dart';

class MJShareTheme {
  static const double normalSize = 20;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalSize, color: Colors.red),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalSize, color: Colors.blue),
    ),
  );
}
