import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class MoleculeOnboardingCart extends StatelessWidget {
  const MoleculeOnboardingCart({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        AtomText.headingHalf(
          text: title,
          padding: EdgeInsets.zero,
          color: BuddySitterColor.primaryBeige,
        ),
        AtomText.content(text: text),
        Image.asset(
          image,
          width: MediaHandler.proportionalWidth(mobile: 387.0),
          height: MediaHandler.proportionalWidth(mobile: 237.0),
        ),
      ],
    );
  }
}
