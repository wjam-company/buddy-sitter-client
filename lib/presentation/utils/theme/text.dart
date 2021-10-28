import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuddySitterText {
  static TextStyle get headingHigh => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: MediaHandler.proportionalWidth(mobile: 28.0),
      );
  static TextStyle get headingHalf => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: MediaHandler.proportionalWidth(mobile: 24.0),
      );
  static TextStyle get headingLeast => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: MediaHandler.proportionalWidth(mobile: 20.0),
      );

  static TextStyle get subheading => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaHandler.proportionalWidth(mobile: 16.0),
      );
  static TextStyle get content => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaHandler.proportionalWidth(mobile: 14.0),
      );
  static TextStyle get caption => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaHandler.proportionalWidth(mobile: 12.0),
      );
}
