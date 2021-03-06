import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class AtomButton extends StatelessWidget {
  final MaterialPropertyResolver<Color>? colorHadler;
  final MaterialPropertyResolver<Color>? splashColorHandler;
  final Icon? icon;
  final Icon? activeIcon;
  final bool isActive;
  final double? height;
  final AtomText? text;
  final BubblesColor? dotsColor;
  final CircleColor? circleColor;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  static const int typeBottom = 0;
  static const int typeText = 1;
  static const int typeCicle = 2;
  static const int typeInput = 3;
  final int type;

  const AtomButton.bottom({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.height,
    this.colorHadler,
    this.splashColorHandler,
    this.onLongPress,
    this.activeIcon,
    this.dotsColor,
    this.circleColor,
    this.isActive = false,
  })  : type = typeBottom,
        super(key: key);

  const AtomButton.text({
    Key? key,
    required this.text,
    required this.onPressed,
    this.colorHadler,
    this.splashColorHandler,
    this.height,
    this.icon,
    this.onLongPress,
    this.activeIcon,
    this.dotsColor,
    this.circleColor,
    this.isActive = false,
  })  : type = typeText,
        super(key: key);

  const AtomButton.cicle({
    Key? key,
    this.text,
    this.colorHadler,
    required this.onPressed,
    this.splashColorHandler,
    required this.height,
    required this.icon,
    this.onLongPress,
    this.activeIcon,
    this.dotsColor,
    this.circleColor,
    this.isActive = false,
  })  : type = typeCicle,
        super(key: key);

  const AtomButton.input({
    Key? key,
    this.text,
    this.colorHadler,
    required this.onPressed,
    this.splashColorHandler,
    this.height,
    required this.icon,
    this.onLongPress,
    this.activeIcon,
    this.dotsColor,
    this.circleColor,
    this.isActive = false,
  })  : type = typeInput,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MediaHandler>(context);
    switch (type) {
      case typeBottom:
        return bottom;
      case typeText:
        return textButton;
      case typeCicle:
        return circleButton;
      case typeInput:
        return inputButton;
      default:
        return bottom;
    }
  }

  ElevatedButton get bottom {
    assert(text != null, 'Your need defined the height');
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        backgroundColor: MaterialStateColor.resolveWith(
          colorHadler ?? (_) => Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: MediaHandler.requiredMultiple(
          mobile: [
            text ?? AtomText.content(text: ''),
          ],
          desktop: [
            icon as Icon,
            text ?? AtomText.content(text: ''),
          ],
        ),
      ),
    );
  }

  TextButton get textButton {
    assert(text != null, 'Your need defined the height');
    return TextButton(
      style: ButtonStyle(
        shadowColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        backgroundColor: MaterialStateColor.resolveWith(
          colorHadler ?? (_) => Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: text ?? AtomText.content(text: ''),
    );
  }

  ClipOval get circleButton {
    assert(height != null, 'Your need defined the height');
    assert(icon != null, 'Your need defined the icon');
    return ClipOval(
      child: Material(
        color: colorHadler != null
            ? colorHadler!(<MaterialState>{})
            : Colors.transparent,
        child: SizedBox(
          width: height,
          height: height,
          child: LikeButton(
            isLiked: isActive,
            onTap: (active) async {
              Future.delayed(const Duration(milliseconds: 800), onPressed);
              return !active;
            },
            padding: EdgeInsets.zero.copyWith(
              top: (height ?? 30) * 0.01,
              left: (height ?? 30) * 0.05,
            ),
            size: (height ?? 30) * 0.5,
            circleColor: circleColor ??
                CircleColor(
                  start: BuddySitterColor.primaryBeige,
                  end: BuddySitterColor.primaryBeige.brighten(.3),
                ),
            bubblesColor: dotsColor ??
                BubblesColor(
                  dotPrimaryColor: BuddySitterColor.primaryPurple,
                  dotSecondaryColor: BuddySitterColor.primaryGreen,
                  dotThirdColor: BuddySitterColor.complementaryLilac,
                  dotLastColor: BuddySitterColor.complementaryRed,
                ),
            likeCountAnimationType: LikeCountAnimationType.none,
            likeBuilder: (bool isLiked) {
              if (isActive) {
                return (activeIcon);
              }
              if (isLiked) {
                return (activeIcon ?? icon!);
              }
              return (icon!);
            },
          ),
        ),
      ),
    );
  }

  SizedBox get inputButton {
    assert(text != null, 'Your need defined the height');
    return SizedBox(
      width: double.infinity,
      height: (BuddySitterMeasurement.sizeHigh) -
          ((BuddySitterText.content.fontSize as double) / 2),
      child: TextButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BuddySitterMeasurement.borderRadiusHalf,
              side: BorderSide(
                color: BuddySitterColor.actionsLog,
              ),
            ),
          ),
          shadowColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor: MaterialStateColor.resolveWith(
            colorHadler ?? (_) => BuddySitterColor.light.brighten(0.8),
          ),
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Row(
          children: [
            text ?? AtomText.content(text: ''),
            const Spacer(),
            Padding(
              padding: EdgeInsets.zero.copyWith(
                left: BuddySitterMeasurement.sizeHalf * 0.75,
                right: ((BuddySitterMeasurement.sizeHalf) * 1.75),
              ),
              child: icon ?? const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
