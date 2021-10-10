import 'package:buddy_sitter/presentation/pages/splash/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/animation.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
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
    _size ??= MediaHandler.proportionalWidth(
            mobile: AverageResolutions.mobile.width / length) -
        (BuddySitterMeasurement.sizeLeast * (length * 2));
    return _size as double;
  }

  EdgeInsets get margin {
    _margin ??=
        BuddySitterMeasurement.marginsLeast.copyWith(top: 0.0, bottom: 0.0);
    return _margin as EdgeInsets;
  }

  double get height {
    _height ??= BuddySitterMeasurement.sizeLeast;
    return _height as double;
  }

  BoxDecoration get decoration {
    _decoration ??= BoxDecoration(
      color: BuddySitterColor.primaryBeige.brighten(0.75),
      borderRadius: BuddySitterMeasurement.borderRadiusLeast,
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
        width: active ? size : 0,
        decoration: decoration.copyWith(
          color: color ?? BuddySitterColor.actionsSuccess,
        ),
      ),
    ]);
  }
}
