import 'dart:ui';
import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:flutter/material.dart';

class ItemListItem {
  final String image;
  final String title;
  final BuddySitterAction action;
  final String content;
  final int imageType;

  ItemListItem({
    required this.image,
    required this.title,
    required this.action,
    required this.content,
    this.imageType = AtomImage.typeNetwork,
  });
}

class MoleculeListTile extends StatelessWidget {
  final ItemListItem? data;
  final String? image;
  final String? title;
  final BuddySitterAction? action;
  final String? content;
  final int? imageType;
  final int ranking;
  final bool contentDecorator;
  final List<Widget>? children;

  const MoleculeListTile.data({
    Key? key,
    required this.data,
    this.image,
    this.title,
    this.action,
    this.content,
    this.imageType,
    this.children,
    this.ranking = -1,
    this.contentDecorator = false,
  }) : super(key: key);

  const MoleculeListTile.list({
    Key? key,
    this.data,
    required this.image,
    this.title,
    this.action,
    this.content,
    required this.imageType,
    required this.children,
    this.ranking = -1,
    this.contentDecorator = false,
  }) : super(key: key);

  const MoleculeListTile.review({
    Key? key,
    this.data,
    required this.image,
    required this.title,
    this.action,
    required this.content,
    required this.imageType,
    this.children,
    required this.ranking,
    this.contentDecorator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMediaQuery = MediaQuery.of(context).size.width;

    double? width = MediaHandler.dynamicType(
      mobile: widthMediaQuery -
          ((BuddySitterMeasurement.sizeHalf * 2) +
              (BuddySitterMeasurement.sizeHigh * 1.5)),
      tablet: widthMediaQuery -
          ((BuddySitterMeasurement.sizeHalf * 2) +
              (BuddySitterMeasurement.sizeHigh * 1.5)),
      desktop: null,
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
        vertical: BuddySitterMeasurement.sizeHalf * 0.25,
      ),
      child: Row(
        children: [
          AtomImage.borderRadius(
            type: data == null ? imageType! : data!.imageType,
            src: data == null ? image! : data!.image,
            borderRadius: BorderRadiusClipper.all(
              radius: BuddySitterMeasurement.sizeHalf,
            ),
            width: BuddySitterMeasurement.sizeHigh * 1.5,
            height: BuddySitterMeasurement.sizeHigh * 2,
          ),
          Container(
            width: width,
            padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf * 0.5),
            child: buildContent(context),
          ),
        ],
      ),
    );
  }

  Column buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if ((data != null && data!.title.isNotEmpty) ||
            (title != null && title!.isNotEmpty))
          AtomText.headingLeast(
            text: (data == null) ? title! : data!.title,
            padding: EdgeInsets.zero,
          ),
        if ((data != null && data!.title.isNotEmpty) ||
            (title != null && title!.isNotEmpty))
          SizedBox(
            height: BuddySitterMeasurement.sizeHalf / 2,
          ),
        if ((data != null && data!.content.isNotEmpty) ||
            (content != null && content!.isNotEmpty))
          SizedBox(
            child: AtomText.content(
              textAlign: TextAlign.left,
              text: (data == null) ? content! : data!.content,
              padding: EdgeInsets.zero,
            ),
          ),
        SizedBox(
          height: BuddySitterMeasurement.sizeHalf / 2,
        ),
        if (ranking >= 0)
          AtomRanking.stars(
            ranking: ranking,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        if (children != null && children!.isNotEmpty) ...children!,
        if (data != null || action != null)
          ClipPath(
            clipper: BorderRadiusClipper.all(
              radius: BuddySitterMeasurement.sizeHalf,
            ),
            child: AtomButton.bottom(
              text: AtomText.subheading(
                text: (data == null) ? action!.text : data!.action.text,
                padding: EdgeInsets.symmetric(
                  vertical: BuddySitterMeasurement.sizeHalf -
                      (BuddySitterText.subheading.fontSize ?? 1) * .75,
                  horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
                ),
                color: BuddySitterColor.light,
              ),
              onPressed:
                  (data == null) ? action!.onPressed : data!.action.onPressed,
              onLongPress: (data == null)
                  ? action!.onLongPress
                  : data!.action.onLongPress,
              colorHadler: (_) => BuddySitterColor.actionsLog,
              height: BuddySitterMeasurement.sizeHigh,
              icon: (data == null) ? action!.icon : data!.action.icon,
            ),
          )
      ],
    );
  }
}
