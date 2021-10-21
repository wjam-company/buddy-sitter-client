import 'dart:math';
import './interfaces.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class CardProfileClipper extends CustomClipperPath {
  CardProfileClipper({required radius}) : super(radius: radius);
  @override
  Path getClip(Size size) {
    Path path = Path();
    double top = 0,
        bottom = size.height,
        left = 0,
        right = size.width,
        centerX = size.width * 0.5;
    curve(
      path,
      start: Point(left, bottom),
      radius: radius,
      side: CustomClipperPath.leftBottom,
    );
    curve(
      path,
      start: Point(right, bottom),
      radius: radius,
      side: CustomClipperPath.rightBottom,
    );
    path.lineTo(right, top);

    final double radiusImage = (radius * 2);
    curve(
      path,
      start: Point(centerX + radiusImage, top),
      radius: radius,
      side: CustomClipperPath.leftTop,
    );
    curve(
      path,
      start: Point(centerX + radiusImage, radiusImage * 1.9),
      radius: radiusImage,
      side: CustomClipperPath.rightBottom,
      insert: true,
    );
    curve(
      path,
      start: Point(centerX - radiusImage, radiusImage * 1.9),
      radius: radiusImage,
      side: CustomClipperPath.leftBottom,
      insert: true,
    );
    curve(
      path,
      start: Point(centerX - radiusImage, top),
      radius: radius,
      side: CustomClipperPath.rightTop,
    );
    path.lineTo(left, top);
    path.close();

    return path;
  }
}

class CardPostClipper extends CustomClipperPath {
  CardPostClipper({required radius}) : super(radius: radius);
  @override
  Path getClip(Size size) {
    Path path = Path();
    double top = 0, bottom = size.height, left = 0, right = size.width;

    path.lineTo(left, bottom);
    path.lineTo(right, bottom);

    curve(
      path,
      start: Point(right, top),
      radius: radius,
      side: CustomClipperPath.rightTop,
    );
    curve(
      path,
      start: Point(left, top),
      radius: radius,
      side: CustomClipperPath.leftTop,
    );
    path.close();

    return path;
  }
}
