import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class AtomButton extends StatelessWidget {
  final String text;
  final MaterialPropertyResolver<Color> colorHadler;
  final void Function()? onPressed;
  const AtomButton({
    Key? key,
    required this.text,
    required this.colorHadler,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        backgroundColor: MaterialStateColor.resolveWith(colorHadler),
      ),
      onPressed: onPressed,
      child: AtomText.subheading(
        text: text,
        color: BuddySitterColor.light.brighten(0.5),
      ),
    );
  }
}
