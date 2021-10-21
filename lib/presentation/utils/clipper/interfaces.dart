import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CustomClipperPath extends CustomClipper<Path> {
  final double radius;
  static const double leftTop = 0;
  static const double leftBottom = 1;
  static const double rightBottom = 2;
  static const double rightTop = 3;
  const CustomClipperPath({required this.radius});

  void curve(
    Path path, {
    required Point<double> start,
    required double radius,
    required double side,
    bool insert = false,
  }) {
    if (side > 3) {
      return;
    }
    Offset startCurve = Offset(start.x, start.y);
    if (!insert) {
      if (side == leftBottom) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x + radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightBottom) {
        path.lineTo(start.x - radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightTop) {
        path.lineTo(start.x, start.y + radius);
        Offset endCurve = Offset(start.x - radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == leftTop) {
        path.lineTo(start.x + radius, start.y);
        Offset endCurve = Offset(start.x, start.y + radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
    } else {
      if (side == leftBottom) {
        path.lineTo(start.x + radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightBottom) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x - radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightTop) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x + radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == leftTop) {
        path.lineTo(start.x - radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
    }
  }

  @override
  Path getClip(Size size) {
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
