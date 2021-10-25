import 'dart:ui';

import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/material.dart';

class MoleculeListTile extends StatelessWidget {
  final String image;
  final String title;
  final BuddySitterAction action;
  final String content;
  const MoleculeListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
        vertical: BuddySitterMeasurement.sizeHalf * 0.25,
      ),
      child: Row(
        //contentPadding: EdgeInsets.zero,
        children: [
          ClipPath(
            clipper: BorderRadiusClipper.all(
                radius: BuddySitterMeasurement.sizeHalf),
            child: SizedBox(
              width: BuddySitterMeasurement.sizeHigh * 1.5,
              height: BuddySitterMeasurement.sizeHigh * 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AtomImage.simple(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    height: double.infinity,
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat,
                    src: image,
                    type: AtomImage.typeNetwork,
                  ),
                  AtomImage.simple(
                    fit: BoxFit.cover,
                    src: image,
                    type: AtomImage.typeNetwork,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AtomText.headingLeast(
                  text: title,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: BuddySitterMeasurement.sizeHalf / 2,
                ),
                AtomText.content(
                  text: content,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: BuddySitterMeasurement.sizeHalf / 2,
                ),
                ClipPath(
                  clipper: BorderRadiusClipper.all(
                    radius: BuddySitterMeasurement.sizeHalf,
                  ),
                  child: AtomButton.bottom(
                    text: AtomText.subheading(
                      text: action.text,
                      padding: EdgeInsets.symmetric(
                        vertical: BuddySitterMeasurement.sizeHalf -
                            (BuddySitterText.subheading.fontSize ?? 1) * .75,
                        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
                      ),
                      color: BuddySitterColor.light,
                    ),
                    onPressed: action.onPressed,
                    onLongPress: action.onLongPress,
                    colorHadler: (_) => BuddySitterColor.actionsLog,
                    height: BuddySitterMeasurement.sizeHigh,
                    icon: action.icon,
                    /*
                    */
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
