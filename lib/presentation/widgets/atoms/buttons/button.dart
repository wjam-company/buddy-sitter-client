import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class AtomButton extends StatelessWidget {
  final MaterialPropertyResolver<Color>? colorHadler;
  final AtomText text;
  final void Function()? onPressed;
  static const int typeBottom = 0;
  static const int typeText = 1;
  final int type;

  const AtomButton.bottom({
    Key? key,
    required this.text,
    this.colorHadler,
    this.onPressed,
  })  : type = typeBottom,
        super(key: key);

  const AtomButton.text({
    Key? key,
    required this.text,
    this.colorHadler,
    this.onPressed,
  })  : type = typeText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case typeBottom:
        return bottom;
      case typeText:
        return textButton;
      default:
        return bottom;
    }
  }

  ElevatedButton get bottom => ElevatedButton(
        style: ButtonStyle(
          shadowColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor: MaterialStateColor.resolveWith(
            colorHadler ?? (_) => Colors.transparent,
          ),
        ),
        onPressed: onPressed,
        child: text,
      );

  TextButton get textButton => TextButton(
        style: ButtonStyle(
          shadowColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor: MaterialStateColor.resolveWith(
            colorHadler ?? (_) => Colors.transparent,
          ),
        ),
        onPressed: onPressed,
        child: text,
      );
}
