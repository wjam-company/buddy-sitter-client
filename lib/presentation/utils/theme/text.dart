import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuddySitterText {
  static final TextStyle headingHigh = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: MediaHandler.proportionalWidth(mobile: 28.0),
  );
  static final TextStyle headingHalf = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: MediaHandler.proportionalWidth(mobile: 24.0),
  );
  static final TextStyle headingLeast = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: MediaHandler.proportionalWidth(mobile: 20.0),
  );

  static final TextStyle subheading = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: MediaHandler.proportionalWidth(mobile: 16.0),
  );
  static final TextStyle content = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: MediaHandler.proportionalWidth(mobile: 14.0),
  );
  static final TextStyle caption = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: MediaHandler.proportionalWidth(mobile: 12.0),
  );
}
