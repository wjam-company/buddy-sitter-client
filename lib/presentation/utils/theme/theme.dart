import 'package:flutter/material.dart';
import './color.dart';

class BuddySitterTheme {
  static ThemeData get config {
    Color backgroundColor = BuddySitterColor.light.brighten(0.6);
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: BuddySitterColor.dark.brighten(0.4),
        ),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      fontFamily: 'BuddySitter',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: BuddySitterColor.dark),
        bodyText2: TextStyle(color: BuddySitterColor.dark),
      ),
    );
  }
}
