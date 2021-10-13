import 'package:flutter/material.dart';
import './color.dart';
import './measurement.dart';

class BuddySitterTheme {
  static final Color _backgroundColor = BuddySitterColor.light.brighten(0.6);
  static ThemeData get config {
    return ThemeData(
      inputDecorationTheme: inputDecorationTheme,
      scaffoldBackgroundColor: _backgroundColor,
      backgroundColor: _backgroundColor,
      appBarTheme: appBarTheme,
      fontFamily: 'BuddySitter',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme,
    );
  }

  static TextTheme get textTheme => TextTheme(
        bodyText1: TextStyle(color: BuddySitterColor.dark),
        bodyText2: TextStyle(color: BuddySitterColor.dark),
      );

  static AppBarTheme get appBarTheme => AppBarTheme(
        iconTheme: IconThemeData(
          color: BuddySitterColor.dark.brighten(0.4),
        ),
        backgroundColor: _backgroundColor,
        shadowColor: Colors.transparent,
      );

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf,
        vertical: BuddySitterMeasurement.sizeLeast,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BuddySitterMeasurement.borderRadiusHalf,
        borderSide: BorderSide(
          color: BuddySitterColor.actionsLog,
        ),
        gapPadding: BuddySitterMeasurement.sizeLeast,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BuddySitterMeasurement.borderRadiusHalf,
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        gapPadding: BuddySitterMeasurement.sizeLeast,
      ),
    );
  }
}
