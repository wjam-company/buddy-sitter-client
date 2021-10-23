import 'dart:ui';
import 'package:flutter/material.dart';

class AverageResolutions {
  static const Size desktop = Size(1600.0, 860);
  static const Size tablet = Size(950.0, 1366.0);
  static const Size mobile = Size(387.0, 777.0);
}

class MediaHandler {
  static T? runWhen<T>({
    T? Function()? mobile,
    T? Function()? desktop,
    T? Function()? tablet,
  }) {
    if (isDesktop) {
      return desktop == null ? null : desktop();
    }
    if (isTablet) {
      return tablet == null ? null : tablet();
    }
    return mobile == null ? null : mobile();
  }

  static dynamic dynamicType({
    dynamic mobile,
    dynamic desktop,
    dynamic tablet,
  }) {
    if (isDesktop) {
      return desktop;
    }
    if (isTablet) {
      return tablet;
    }
    return mobile;
  }

  static Widget requiredSingle({
    required Widget mobile,
    Widget? desktop,
    Widget? tablet,
  }) =>
      MediaHandler.single(
        mobile: mobile,
        desktop: desktop,
        tablet: tablet,
      ) ??
      mobile;

  static List<Widget> requiredMultiple({
    required List<Widget> mobile,
    List<Widget>? desktop,
    List<Widget>? tablet,
  }) =>
      MediaHandler.multiple(
        mobile: mobile,
        desktop: desktop,
        tablet: tablet,
      ) ??
      mobile;

  static Widget? single({
    Widget? mobile,
    Widget? desktop,
    Widget? tablet,
  }) {
    if (isDesktop) {
      return desktop;
    }
    if (isTablet) {
      return tablet;
    }
    return mobile;
  }

  static List<Widget>? multiple({
    List<Widget>? mobile,
    List<Widget>? desktop,
    List<Widget>? tablet,
  }) {
    if (isDesktop) {
      return desktop;
    }
    if (isTablet) {
      return tablet;
    }
    return mobile;
  }

  static bool _isMobile = false;
  static bool _isTablet = false;
  static bool _isDesktop = false;
  // ignore: prefer_const_constructors
  static Size _size = Size(0.0, 0.0);
  static Orientation _orientation = Orientation.landscape;

  static bool get isMoble => _isMobile;
  static set _setMoble(MediaQueryData data) {
    _isMobile = data.size.width < 800;
  }

  static bool get isTablet => _isTablet;
  static set _setTablet(MediaQueryData data) {
    _isTablet = data.size.width >= 800 && data.size.width < 1200;
  }

  static bool get isDesktop => _isDesktop;

  static set _setDesktop(MediaQueryData data) {
    _isDesktop = data.size.width > 1200;
  }

  static set _setSize(MediaQueryData data) {
    _size = data.size;
  }

  static set _setOrientation(MediaQueryData data) {
    _orientation = data.orientation;
  }

  static double proportionalHeight(
      {required double mobile,
      // ignore: avoid_init_to_null
      double? desktop = null,
      // ignore: avoid_init_to_null
      double? tablet = null}) {
    desktop ??= mobile;
    tablet ??= mobile;
    if (isDesktop) {
      return (desktop / AverageResolutions.desktop.height) * _size.height;
    }
    if (isTablet) {
      return (tablet / AverageResolutions.tablet.height) * _size.height;
    }
    return (tablet / AverageResolutions.mobile.height) * _size.height;
  }

  static double proportionalWidth(
      {required double mobile,
      // ignore: avoid_init_to_null
      double? desktop = null,
      // ignore: avoid_init_to_null
      double? tablet = null}) {
    desktop ??= mobile;
    tablet ??= mobile;
    if (isDesktop) {
      return (desktop / AverageResolutions.desktop.width) * _size.width;
    }
    if (isTablet) {
      return (tablet / AverageResolutions.tablet.width) * _size.width;
    }
    return (tablet / AverageResolutions.mobile.width) * _size.width;
  }

  static MediaQueryData of(BuildContext context) {
    final MediaQueryData data = (WidgetsBinding.instance?.window == null)
        ? MediaQuery.of(context)
        : MediaQueryData.fromWindow(
            WidgetsBinding.instance?.window as SingletonFlutterWindow);

    _setOrientation = _setSize = _setMoble = _setTablet = _setDesktop = data;

    runWhen(
      mobile: () => print('Mobile'),
      tablet: () => print('tablet'),
      desktop: () => print('desktop'),
    );

    return data;
  }
}
