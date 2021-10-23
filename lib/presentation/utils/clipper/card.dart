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

class BorderRadiusClipper extends CustomClipperPath {
  // ignore: overridden_fields
  final bool leftBottom;
  // ignore: overridden_fields
  final bool rightBottom;
  // ignore: overridden_fields
  final bool rightTop;
  // ignore: overridden_fields
  final bool leftTop;
  BorderRadiusClipper.all({required radius})
      : leftBottom = true,
        rightBottom = true,
        rightTop = true,
        leftTop = true,
        super(radius: radius);
  BorderRadiusClipper.top({required radius})
      : leftBottom = false,
        rightBottom = false,
        rightTop = true,
        leftTop = true,
        super(radius: radius);
  BorderRadiusClipper.bottom({required radius})
      : leftBottom = true,
        rightBottom = true,
        rightTop = false,
        leftTop = false,
        super(radius: radius);
  BorderRadiusClipper.left({required radius})
      : leftBottom = true,
        rightBottom = false,
        rightTop = false,
        leftTop = true,
        super(radius: radius);
  BorderRadiusClipper.right({required radius})
      : leftBottom = false,
        rightBottom = true,
        rightTop = true,
        leftTop = false,
        super(radius: radius);
  BorderRadiusClipper.only({
    required radius,
    this.leftBottom = false,
    this.rightBottom = false,
    this.rightTop = false,
    this.leftTop = false,
  }) : super(radius: radius);
  @override
  Path getClip(Size size) {
    Path path = Path();
    double top = 0, bottom = size.height, left = 0, right = size.width;

    if (leftBottom) {
      curve(
        path,
        start: Point(left, bottom),
        radius: radius,
        side: CustomClipperPath.leftBottom,
      );
    } else {
      path.lineTo(left, bottom);
    }
    if (rightBottom) {
      curve(
        path,
        start: Point(right, bottom),
        radius: radius,
        side: CustomClipperPath.rightBottom,
      );
    } else {
      path.lineTo(right, bottom);
    }

    if (rightTop) {
      curve(
        path,
        start: Point(right, top),
        radius: radius,
        side: CustomClipperPath.rightTop,
      );
    } else {
      path.lineTo(right, top);
    }

    if (leftTop) {
      curve(
        path,
        start: Point(left, top),
        radius: radius,
        side: CustomClipperPath.leftTop,
      );
    } else {
      path.lineTo(left, top);
    }

    path.close();

    return path;
  }
}
