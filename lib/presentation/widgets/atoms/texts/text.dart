import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:flutter/material.dart';

class AtomText extends StatelessWidget {
  final TextStyle style;
  final String text;
  final bool flex;
  final TextAlign textAlign;
  final EdgeInsets? padding;
  final Color? color;

  AtomText.headingHigh({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.headingHigh,
        super(key: key);

  AtomText.headingHalf({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.headingHalf,
        super(key: key);

  AtomText.headingLeast({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.headingLeast,
        super(key: key);

  AtomText.subheading({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.subheading,
        super(key: key);

  AtomText.content({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.content,
        super(key: key);

  AtomText.caption({
    Key? key,
    required this.text,
    this.flex = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.color,
  })  : style = BuddySitterText.caption,
        super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(
          padding?.left ?? style.fontSize ?? 0,
          padding?.top ?? style.fontSize ?? 1 / 2,
          padding?.right ?? style.fontSize ?? 0.5,
          padding?.bottom ?? style.fontSize ?? 1 / 2,
        ),
        child: Text(
          text,
          softWrap: true,
          style: style.copyWith(color: color ?? BuddySitterColor.dark),
          textAlign: textAlign,
        ),
      );
}
