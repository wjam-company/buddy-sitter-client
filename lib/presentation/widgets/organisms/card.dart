import 'dart:ui';
import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/material.dart';

class OrganismCard extends StatelessWidget {
  final String image;
  final String profile;
  final String name;
  final String content;
  final ActionsRowFLex actionLeft;
  final ActionsRowFLex actionRight;
  final bool margin;
  final bool topBorderRadius;
  const OrganismCard.simple({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
  })  : margin = true,
        topBorderRadius = true,
        super(key: key);

  const OrganismCard.complete({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
  })  : margin = true,
        topBorderRadius = true,
        super(key: key);

  const OrganismCard.headder({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
  })  : margin = false,
        topBorderRadius = false,
        super(key: key);

  Widget decoratorMargin(Widget child) => margin
      ? Container(
          margin: EdgeInsets.symmetric(
            horizontal: BuddySitterMeasurement.sizeHalf / 2,
          ),
          child: child,
        )
      : SizedBox(
          child: child,
        );

  Widget decoratorBorderRadius(Widget child) => topBorderRadius
      ? ClipPath(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          clipper: BorderRadiusClipper.all(
            radius: BuddySitterMeasurement.sizeHalf,
          ),
          child: child,
        )
      : ClipPath(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          clipper: BorderRadiusClipper.bottom(
            radius: BuddySitterMeasurement.sizeHalf,
          ),
          child: child,
        );

  @override
  Widget build(BuildContext context) {
    return decoratorMargin(
      decoratorBorderRadius(
        SizedBox(
          height: MediaHandler.dynamicType(
            mobile: BuddySitterMeasurement.sizeHigh * 5.8,
            tablet: BuddySitterMeasurement.sizeHigh * 8,
            desktop: BuddySitterMeasurement.sizeHigh * 8,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaHandler.dynamicType(
                  mobile: BuddySitterMeasurement.sizeHigh * 5.8,
                  tablet: BuddySitterMeasurement.sizeHigh * 8,
                  desktop: BuddySitterMeasurement.sizeHigh * 8,
                ),
                child: AtomImage.simple(
                  repeat: ImageRepeat.repeat,
                  imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  src: image,
                  type: AtomImage.typeNetwork,
                ),
              ),
              Column(
                children: [
                  AtomImage.simple(
                    src: image,
                    height: MediaHandler.dynamicType(
                      mobile: BuddySitterMeasurement.sizeHigh * 2.8,
                      tablet: BuddySitterMeasurement.sizeHigh * 5,
                      desktop: BuddySitterMeasurement.sizeHigh * 5,
                    ),
                    type: AtomImage.typeNetwork,
                  ),
                  ClipPath(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    clipper: CardProfileClipper(
                      radius: BuddySitterMeasurement.sizeHalf,
                    ),
                    child: Container(
                      color: BuddySitterColor.primaryBeige.brighten(.9),
                      height: BuddySitterMeasurement.sizeHigh * 3,
                      width: double.infinity,
                      padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
                      child: Column(
                        children: [
                          SizedBox(
                            height: BuddySitterMeasurement.sizeHigh,
                          ),
                          AtomText.subheading(
                            text: name,
                            padding: EdgeInsets.zero,
                            color: BuddySitterColor.dark,
                          ),
                          const Spacer(),
                          AtomText.content(
                            text: content,
                            padding: EdgeInsets.zero,
                            color: BuddySitterColor.dark,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaHandler.dynamicType(
                    mobile: BuddySitterMeasurement.sizeHigh * 2.8,
                    tablet: BuddySitterMeasurement.sizeHigh * 5,
                    desktop: BuddySitterMeasurement.sizeHigh * 5,
                  ),
                ),
                child: MoleculeRowFLex.simple(
                  children: [
                    AtomButton.cicle(
                      onPressed: actionLeft.onPressed,
                      onLongPress: actionLeft.onLongPress,
                      height: BuddySitterMeasurement.sizeHalf * 3,
                      icon: actionLeft.icon,
                    ),
                    AtomImage.circle(
                      src: profile,
                      radius: BuddySitterMeasurement.sizeHalf * 1.8,
                      type: AtomImage.typeNetwork,
                    ),
                    AtomButton.cicle(
                      onPressed: actionRight.onPressed,
                      onLongPress: actionRight.onLongPress,
                      height: BuddySitterMeasurement.sizeHalf * 3,
                      icon: actionRight.icon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // decoratorBorderRadius
    ); // decoratorMargin
  }
}
