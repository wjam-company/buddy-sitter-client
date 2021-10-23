import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:flutter/material.dart';

class BuddySitterMeasurement {
  static double get sizeLeast => MediaHandler.proportionalWidth(
        mobile: 3.0,
        tablet: 3.0,
        desktop: 5.0,
      );

  static double get sizeHalf => MediaHandler.proportionalWidth(
        mobile: 25.0,
        tablet: 21.0,
        desktop: 18.0,
      );

  static double get sizeHigh => MediaHandler.proportionalWidth(
        mobile: 77.0,
        tablet: 65.0,
        desktop: 55.0,
      );

  static double get sizeUpper => MediaHandler.proportionalWidth(
        mobile: AverageResolutions.mobile.width,
        desktop: AverageResolutions.desktop.width,
        tablet: AverageResolutions.tablet.width,
      );

  static EdgeInsets get marginsLeast => EdgeInsets.all(sizeLeast);

  static EdgeInsets get marginsHalf => EdgeInsets.all(sizeHalf);

  static EdgeInsets get marginsHigh => EdgeInsets.all(sizeHigh);

  static BorderRadius get borderRadiusLeast => BorderRadius.circular(sizeLeast);

  static BorderRadius get borderRadiusHalf => BorderRadius.circular(sizeHalf);

  static BorderRadius get borderRadiusHigh => BorderRadius.circular(sizeHigh);
}
