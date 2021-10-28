import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AverageResolutions {
  static const Size desktop = Size(1600.0, 860);
  static const Size tablet = Size(950.0, 1366.0);
  static const Size mobile = Size(387.0, 777.0);
}

class MediaHandler extends ChangeNotifier {
  MediaHandler._internal();

  static final MediaHandler _singleton = MediaHandler._internal();

  factory MediaHandler() => _singleton;

  static T? runWhen<T>({
    T? Function()? mobile,
    T? Function()? desktop,
    T? Function()? tablet,
  }) {
    if (MediaHandler().isDesktop) {
      return desktop == null ? null : desktop();
    }
    if (MediaHandler().isTablet) {
      return tablet == null ? null : tablet();
    }
    return mobile == null ? null : mobile();
  }

  static dynamic dynamicType({
    dynamic mobile,
    dynamic desktop,
    dynamic tablet,
  }) {
    if (MediaHandler().isDesktop) {
      return desktop;
    }
    if (MediaHandler().isTablet) {
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
    if (MediaHandler().isDesktop) {
      return desktop;
    }
    if (MediaHandler().isTablet) {
      return tablet;
    }
    return mobile;
  }

  static List<Widget>? multiple({
    List<Widget>? mobile,
    List<Widget>? desktop,
    List<Widget>? tablet,
  }) {
    if (MediaHandler().isDesktop) {
      return desktop;
    }
    if (MediaHandler().isTablet) {
      return tablet;
    }
    return mobile;
  }

  bool _isMobile = false;
  bool _isTablet = false;
  bool _isDesktop = false;
  // ignore: prefer_const_constructors
  static Size _size = Size(0.0, 0.0);
  static Orientation _orientation = Orientation.landscape;

  bool get isMoble => _isMobile;
  set _setMoble(MediaQueryData data) {
    _isMobile = data.size.width < 800;
  }

  bool get isTablet => _isTablet;
  set _setTablet(MediaQueryData data) {
    _isTablet = data.size.width >= 800 && data.size.width < 1200;
  }

  bool get isDesktop => _isDesktop;

  set _setDesktop(MediaQueryData data) {
    _isDesktop = data.size.width > 1200;
  }

  set _setSize(MediaQueryData data) {
    _size = data.size;
  }

  set _setOrientation(MediaQueryData data) {
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
    if (MediaHandler().isDesktop) {
      return (desktop / AverageResolutions.desktop.height) * _size.height;
    }
    if (MediaHandler().isTablet) {
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
    if (MediaHandler().isDesktop) {
      return (desktop / AverageResolutions.desktop.width) * _size.width;
    }
    if (MediaHandler().isTablet) {
      return (tablet / AverageResolutions.tablet.width) * _size.width;
    }
    return (tablet / AverageResolutions.mobile.width) * _size.width;
  }

  static MediaQueryData of(BuildContext context, {bool listen = true}) {
    final MediaQueryData data = (WidgetsBinding.instance?.window == null)
        ? MediaQuery.of(context)
        : MediaQueryData.fromWindow(
            WidgetsBinding.instance?.window as SingletonFlutterWindow);

    MediaHandler()._setOrientation = MediaHandler()._setSize =
        MediaHandler()._setMoble =
            MediaHandler()._setTablet = MediaHandler()._setDesktop = data;

    MediaHandler.runWhen(
      mobile: () => print('Mobile'),
      tablet: () => print('tablet'),
      desktop: () => print('desktop'),
    );

    return data;
  }

  static change() {
    MediaHandler().notifyListeners();
  }
}
