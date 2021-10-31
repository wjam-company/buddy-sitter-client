import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:flutter/material.dart';

class AtomImage extends StatelessWidget {
  final double? aspectRatio;
  final String? src;
  final File? file;
  final Uint8List? bytes;
  final int type;
  final double? height;
  final double? width;
  final double? radius;
  final double? scale;
  final ImageFilter? imageFilter;
  final BorderRadiusClipper? borderRadius;
  final BoxFit? fit;
  final ImageRepeat? repeat;
  static const int typeNetwork = 0;
  static const int typeAsset = 1;
  static const int typeFile = 2;
  static const int typeMemory = 3;

  const AtomImage.simple({
    Key? key,
    required this.type,
    this.src,
    this.aspectRatio,
    this.file,
    this.bytes,
    this.imageFilter,
    this.height,
    this.width,
    this.radius,
    this.scale,
    this.fit,
    this.repeat,
    this.borderRadius,
  }) : super(key: key);

  const AtomImage.borderRadius({
    Key? key,
    required this.type,
    this.src,
    this.aspectRatio,
    this.file,
    this.bytes,
    this.imageFilter,
    this.height,
    this.width,
    this.radius,
    this.scale,
    this.fit,
    this.repeat,
    required this.borderRadius,
  }) : super(key: key);

  const AtomImage.aspectRatio({
    Key? key,
    required this.aspectRatio,
    this.src,
    required this.type,
    this.file,
    this.bytes,
    this.imageFilter,
    this.height,
    this.width,
    this.radius,
    this.scale,
    this.repeat,
    this.borderRadius,
  })  : fit = BoxFit.cover,
        super(key: key);

  AtomImage.circle({
    Key? key,
    required this.radius,
    required this.type,
    this.aspectRatio,
    this.src,
    this.file,
    this.bytes,
    this.imageFilter,
    this.scale,
    this.repeat,
    this.borderRadius,
    this.fit,
  })  : height = fromRadius(radius ?? BuddySitterMeasurement.sizeHalf),
        width = fromRadius(radius ?? BuddySitterMeasurement.sizeHalf),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (borderRadius != null) {
      return buildBorderRadius();
    }
    return decoratorCircle(
      decoratorAspectRatio(
        decoratorFiltered(getImage),
      ), // decoratorAspectRatio
    ); // decoratorCircle
  }

  static double fromRadius(double radius) => (radius * 2.0);

  Image get getImage {
    switch (type) {
      case typeNetwork:
        return Image.network(
          src ?? '',
          height: height,
          width: width,
          repeat: repeat ?? ImageRepeat.noRepeat,
          scale: scale ?? 1.0,
          fit: fit,
        );
      case typeAsset:
        return Image.asset(
          src ?? '',
          height: height,
          width: width,
          repeat: repeat ?? ImageRepeat.noRepeat,
          scale: scale ?? 1.0,
          fit: fit,
        );
      case typeFile:
        assert(file != null, 'file no defined');
        assert(file is File, 'file need is defined with File');
        return Image.file(
          file as File,
          height: height,
          width: width,
          repeat: repeat ?? ImageRepeat.noRepeat,
          scale: scale ?? 1.0,
          fit: fit,
        );
      case typeMemory:
        assert(bytes != null, 'bytes no defined');
        assert(bytes is Uint8List, 'byte need is defined with Uint8List');
        return Image.memory(
          bytes as Uint8List,
          height: height,
          width: width,
          repeat: repeat ?? ImageRepeat.noRepeat,
          scale: scale ?? 1.0,
          fit: fit,
        );
      default:
        return Image.asset(
          src ?? '',
          height: height,
          width: width,
          repeat: repeat ?? ImageRepeat.noRepeat,
          scale: scale ?? 1.0,
          fit: fit,
        );
    }
  }

  Widget decoratorFiltered(Widget child) => imageFilter != null
      ? ImageFiltered(
          imageFilter: imageFilter as ImageFilter,
          child: child,
        )
      : child;

  Widget decoratorAspectRatio(Widget child) => aspectRatio != null
      ? AspectRatio(
          aspectRatio: aspectRatio as double,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        )
      : child;

  Widget decoratorCircle(Widget child) {
    if (radius != null) {
      return ClipOval(
        child: SizedBox(
          width: (radius as double) * 2,
          height: (radius as double) * 2,
          child: child,
        ),
      );
    }
    return child;
  }

  ClipPath buildBorderRadius() {
    return ClipPath(
      clipper: borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AtomImage.simple(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              height: height,
              fit: fit,
              repeat: ImageRepeat.repeat,
              src: src,
              type: type,
            ),
            AtomImage.simple(
              fit: fit,
              src: src,
              type: type,
            ),
          ],
        ),
      ),
    );
  }
}
