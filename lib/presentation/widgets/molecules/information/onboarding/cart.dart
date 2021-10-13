import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class MoleculeOnboardingCart extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  final BuddySitterColor? color;

  const MoleculeOnboardingCart({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        AtomText.headingHalf(
          text: title,
          padding: EdgeInsets.zero,
          color: color ?? BuddySitterColor.primaryPurple,
        ),
        AtomText.content(text: text),
        Image.asset(
          image,
          width: MediaHandler.proportionalWidth(mobile: 387.0),
          height: MediaHandler.proportionalHeight(mobile: 287.0),
        ),
      ],
    );
  }
}