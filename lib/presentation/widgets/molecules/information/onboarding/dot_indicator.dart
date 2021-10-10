import 'package:buddy_sitter/data/static/texts/onboarding.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/onboarding/dot_indicator.dart';
import 'package:flutter/material.dart';

class MoleculeDotIndicator extends StatelessWidget {
  BuddySitterColor? color;
  MoleculeDotIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        DataTextOnboarding.items.length,
        (index) => AtomDotIndicator(
          color: color,
          index: index,
          length: DataTextOnboarding.items.length,
        ),
      ),
    );
  }
}
