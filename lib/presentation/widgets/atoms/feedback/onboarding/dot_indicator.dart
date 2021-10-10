import 'package:buddy_sitter/presentation/pages/splash/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/animation.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtomDotIndicator extends StatelessWidget {
  final int index;
  final int length;
  double? _size;
  EdgeInsets? _margin;
  double? _height;
  BoxDecoration? _decoration;
  BuddySitterColor? color;

  AtomDotIndicator({
    Key? key,
    required this.index,
    required this.length,
    this.color,
  }) : super(key: key);

  double get size {
    _size ??= MediaHandler.proportionalWidth(mobile: 377 / length) -
        (MediaHandler.proportionalWidth(mobile: 3) * (length * 2));
    return _size as double;
  }

  EdgeInsets get margin {
    _margin ??= EdgeInsets.symmetric(
        horizontal: MediaHandler.proportionalWidth(mobile: 3));
    return _margin as EdgeInsets;
  }

  double get height {
    _height ??= MediaHandler.proportionalWidth(mobile: 4);
    return _height as double;
  }

  BoxDecoration get decoration {
    _decoration ??= BoxDecoration(
      color: BuddySitterColor.primaryBeige.brighten(0.75),
      borderRadius: BorderRadius.circular(
        MediaHandler.proportionalWidth(mobile: 3),
      ),
    );
    return _decoration as BoxDecoration;
  }

  @override
  Widget build(BuildContext context) {
    final bool active = Provider.of<ProviderOnboarding>(context).index >= index;
    return Stack(children: [
      Container(
        margin: margin,
        height: height,
        width: size,
        decoration: decoration,
      ),
      AnimatedContainer(
        duration: BuddySitterAnimation.fast,
        margin: margin,
        height: height,
        width: active ? size : MediaHandler.proportionalWidth(mobile: 0),
        decoration: decoration.copyWith(
          color: color ?? BuddySitterColor.actionsSuccess,
        ),
      ),
    ]);
  }
}
