import 'dart:typed_data';
import 'package:image/image.dart' show Image, decodeImage;
import 'package:flutter/material.dart' hide Image;

class BuddySitterColor implements Color {
  final Color _color;

  BuddySitterColor(int value) : _color = Color(value);

  BuddySitterColor.fromARGB(int a, int r, int g, int b)
      : _color = Color.fromARGB(a, r, g, b);

  BuddySitterColor.fromRGBO(int r, int g, int b, double opacity)
      : _color = Color.fromRGBO(r, g, b, opacity);

  @override
  int get alpha => _color.alpha;

  @override
  double get opacity => _color.opacity;

  @override
  int get red => _color.red;

  @override
  int get green => _color.green;

  @override
  int get blue => _color.blue;

  @override
  int get value => _color.value;

  @override
  BuddySitterColor withAlpha(int a) {
    _color.withAlpha(a);
    return BuddySitterColor.fromRGBO(red, green, blue, opacity);
  }

  @override
  BuddySitterColor withOpacity(double opacity) {
    _color.withOpacity(opacity);
    return BuddySitterColor.fromRGBO(red, green, blue, opacity);
  }

  @override
  BuddySitterColor withRed(int r) {
    _color.withRed(r);
    return BuddySitterColor.fromRGBO(red, green, blue, opacity);
  }

  @override
  BuddySitterColor withGreen(int g) {
    _color.withGreen(g);
    return BuddySitterColor.fromRGBO(red, green, blue, opacity);
  }

  @override
  BuddySitterColor withBlue(int b) {
    _color.withBlue(b);
    return BuddySitterColor.fromRGBO(red, green, blue, opacity);
  }

  @override
  double computeLuminance() => _color.computeLuminance();

  static BuddySitterColor? lerp(Color? a, Color? b, double t) {
    final Color? color = Color.lerp(a, b, t);
    if (color == null) {
      return null;
    }
    return BuddySitterColor.fromRGBO(
        color.red, color.green, color.blue, color.opacity);
  }

  static BuddySitterColor alphaBlend(Color foreground, Color background) {
    final Color color = Color.alphaBlend(foreground, background);
    return BuddySitterColor.fromRGBO(
        color.red, color.green, color.blue, color.opacity);
  }

  static int getAlphaFromOpacity(double opacity) =>
      Color.getAlphaFromOpacity(opacity);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Color && other.value == _color.value;
  }

  @override
  int get hashCode => _color.hashCode;

  @override
  String toString() => _color.toString();

  BuddySitterColor brighten([double range = 1]) =>
      BuddySitterColor.lerp(
        this,
        value == light.value ? Colors.white : light,
        range,
      ) ??
      this;

  BuddySitterColor darken([double range = 0.5]) =>
      BuddySitterColor.lerp(
        this,
        value == dark.value ? Colors.black : dark,
        range,
      ) ??
      this;

  static final BuddySitterColor light =
      BuddySitterColor.fromRGBO(0xD1, 0xFF, 0xDA, 1);

  static final BuddySitterColor dark =
      BuddySitterColor.fromRGBO(0x33, 0x47, 0x37, 1);

  static final BuddySitterColor primaryGreen =
      BuddySitterColor.fromRGBO(0x5E, 0xE1, 0x77, 1);

  static final BuddySitterColor primaryPurple =
      BuddySitterColor.fromRGBO(0x9B, 0x75, 0xE0, 1);

  static final BuddySitterColor primaryBeige =
      BuddySitterColor.fromRGBO(0xE0, 0x99, 0x48, 1);

  static final BuddySitterColor complementaryBlue =
      BuddySitterColor.fromRGBO(0x69, 0xE0, 0xC3, 1);

  static final BuddySitterColor complementaryLilac =
      BuddySitterColor.fromRGBO(0xD6, 0x75, 0xE0, 1);

  static final BuddySitterColor complementaryRed =
      BuddySitterColor.fromRGBO(0xE0, 0x6C, 0x48, 1);

  static final BuddySitterColor actionsError =
      BuddySitterColor.fromRGBO(0xE0, 0x48, 0x63, 1);

  static final BuddySitterColor actionsWarning =
      BuddySitterColor.fromRGBO(0xE0, 0xBD, 0x53, 1);

  static final BuddySitterColor actionsLog =
      BuddySitterColor.fromRGBO(0x75, 0x88, 0xE0, 1);

  static final BuddySitterColor actionsSuccess =
      BuddySitterColor.fromRGBO(0x48, 0xE0, 0x64, 1);

  static const int noOfPixelsPerAxis = 10;

  static List<BuddySitterColor> extractPixelsColors(Uint8List? bytes) {
    List<BuddySitterColor> colors = [];

    List<int> values = bytes!.buffer.asUint8List();
    Image? image = decodeImage(values);

    List<int?> pixels = [];

    int? width = image?.width;
    int? height = image?.height;

    int xChunk = width! ~/ (noOfPixelsPerAxis + 1);
    int yChunk = height! ~/ (noOfPixelsPerAxis + 1);

    for (int j = 1; j < noOfPixelsPerAxis + 1; j++) {
      for (int i = 1; i < noOfPixelsPerAxis + 1; i++) {
        int pixel = image?.getPixel(xChunk * i, yChunk * j) ?? 0;
        if (pixel == 0) {
          continue;
        }
        pixels.add(pixel);
        colors.add(
          BuddySitterColor.fromRGBO(
            (pixel) & 0x0ff, // red
            (pixel >> 8) & 0x0ff, // green
            (pixel >> 16) & 0x0ff, // blue
            1,
          ),
        );
      }
    }

/*
    value = ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
              ((r                    & 0xff) << 16) |
              ((g                    & 0xff) << 8)  |
              ((b                    & 0xff) << 0)) & 0xFFFFFFFF;

*/
    return colors;
  }

  static List<BuddySitterColor> sortColors(List<BuddySitterColor> colors) {
    List<BuddySitterColor> sorted = [];

    sorted.addAll(colors);
    sorted.sort((a, b) => b.computeLuminance().compareTo(a.computeLuminance()));

    return sorted;
  }

  static BuddySitterColor getAverageColor(List<BuddySitterColor> colors) {
    int r = 0, g = 0, b = 0;

    for (int i = 0; i < colors.length; i++) {
      r += colors[i].red;
      g += colors[i].green;
      b += colors[i].blue;
    }

    r = r ~/ colors.length;
    g = g ~/ colors.length;
    b = b ~/ colors.length;

    return BuddySitterColor.fromRGBO(r, g, b, 1);
  }
}
