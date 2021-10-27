import 'dart:ui';
import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class MoleculeListTile extends StatelessWidget {
  final ItemListItem data;
  const MoleculeListTile({
    Key? key,
    required this.data,
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
                    src: data.image,
                    type: data.imageType,
                  ),
                  AtomImage.simple(
                    fit: BoxFit.cover,
                    src: data.image,
                    type: data.imageType,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AtomText.headingLeast(
                  text: data.title,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: BuddySitterMeasurement.sizeHalf / 2,
                ),
                if (data.content.isNotEmpty)
                  AtomText.content(
                    text: data.content,
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
                      text: data.action.text,
                      padding: EdgeInsets.symmetric(
                        vertical: BuddySitterMeasurement.sizeHalf -
                            (BuddySitterText.subheading.fontSize ?? 1) * .75,
                        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
                      ),
                      color: BuddySitterColor.light,
                    ),
                    onPressed: data.action.onPressed,
                    onLongPress: data.action.onLongPress,
                    colorHadler: (_) => BuddySitterColor.actionsLog,
                    height: BuddySitterMeasurement.sizeHigh,
                    icon: data.action.icon,
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
