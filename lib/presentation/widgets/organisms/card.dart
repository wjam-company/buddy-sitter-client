import 'dart:ui';

import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OrganismCard extends StatelessWidget {
  final String image;
  final String profile;
  final String name;
  final String content;
  final BuddySitterAction actionLeft;
  final BuddySitterAction actionRight;
  final bool margin;
  final List<Widget>? children;
  final bool _ranking;
  final int ranking;
  final bool topBorderRadius;
  final int typeImage;
  const OrganismCard.simple({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
    this.typeImage = AtomImage.typeNetwork,
    this.ranking = 0,
    this.children,
  })  : margin = true,
        topBorderRadius = true,
        _ranking = false,
        super(key: key);

  const OrganismCard.ranking({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
    required this.ranking,
    this.children,
    this.typeImage = AtomImage.typeNetwork,
  })  : margin = true,
        _ranking = true,
        topBorderRadius = true,
        super(key: key);

  const OrganismCard.list({
    Key? key,
    required this.image,
    required this.profile,
    required this.name,
    required this.content,
    required this.actionLeft,
    required this.actionRight,
    this.ranking = -1,
    required this.children,
    this.typeImage = AtomImage.typeNetwork,
  })  : margin = true,
        _ranking = ranking < 0 ? false : true,
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
    this.ranking = 0,
    this.typeImage = AtomImage.typeNetwork,
    this.children,
  })  : margin = false,
        _ranking = false,
        topBorderRadius = false,
        super(key: key);

  Widget decoratorMargin(Widget child) => margin
      ? Container(
          margin: EdgeInsets.symmetric(
            horizontal: BuddySitterMeasurement.sizeHalf / 2,
            vertical: BuddySitterMeasurement.sizeHalf / 4,
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

  Widget containerInfo(BuddySitterColor color) => Container(
        color: color,
        height: containerInfoHeigth,
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
            if (_ranking)
              AtomRanking.stars(
                ranking: ranking,
              ),
            if (_ranking) const Spacer(),
            AtomText.content(
              text: content,
              padding: EdgeInsets.zero,
              color: BuddySitterColor.dark,
            ),
            const Spacer(),
          ],
        ),
      );

  Widget decoratorColorImage(Widget Function(BuddySitterColor color) widget) {
    if (kIsWeb) {
      return widget(BuddySitterColor.complementaryLilac.brighten(.6));
    }
    if (BuddySitterData().colorFromImages.containsKey(image)) {
      return widget(BuddySitterData().colorFromImages[image]!);
    }
    return FutureBuilder(
      future: (typeImage == AtomImage.typeNetwork
          ? NetworkAssetBundle(Uri.parse(
              image,
            )).load(
              image,
            )
          : rootBundle.load(image)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          BuddySitterColor color = BuddySitterColor.getAverageColor(
            BuddySitterColor.sortColors(
              BuddySitterColor.extractPixelsColors(
                (snapshot.data as ByteData).buffer.asUint8List(),
              ),
            ),
          );
          BuddySitterData().colorFromImages[image] = color.brighten(.3);
          return widget(BuddySitterData().colorFromImages[image]!);
        }
        return widget(BuddySitterColor.light.brighten(.6));
      },
    );
  }

  double get containerInfoHeigth {
    if (_ranking) {
      return BuddySitterMeasurement.sizeHigh * 3.2;
    }
    return BuddySitterMeasurement.sizeHigh * 3;
  }

  double get containerHeight {
    if (_ranking) {
      return MediaHandler.dynamicType(
        mobile: BuddySitterMeasurement.sizeHigh * 6,
        tablet: BuddySitterMeasurement.sizeHigh * 8.2,
        desktop: BuddySitterMeasurement.sizeHigh * 8.2,
      );
    }
    return MediaHandler.dynamicType(
      mobile: BuddySitterMeasurement.sizeHigh * 5.8,
      tablet: BuddySitterMeasurement.sizeHigh * 8,
      desktop: BuddySitterMeasurement.sizeHigh * 8,
    );
  }

  double get headderHeight {
    return MediaHandler.dynamicType(
      mobile: BuddySitterMeasurement.sizeHigh * 2.8,
      tablet: BuddySitterMeasurement.sizeHigh * 5,
      desktop: BuddySitterMeasurement.sizeHigh * 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MediaHandler>(context);
    return decoratorMargin(
      decoratorBorderRadius(
        Stack(
          children: [
            decoratorBorderRadius(
              Container(
                width: double.infinity,
                color: BuddySitterColor.complementaryLilac.brighten(.85),
                child: Column(
                  children: [
                    SizedBox(
                      height: containerHeight,
                    ),
                    if (children != null) ...(children ?? []),
                  ],
                ),
              ),
            ),
            decoratorBorderRadius(
              SizedBox(
                height: containerHeight,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: containerHeight,
                      child: AtomImage.simple(
                        repeat: ImageRepeat.repeat,
                        imageFilter:
                            ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        src: image,
                        type: typeImage,
                      ),
                    ),
                    Column(
                      children: [
                        AtomImage.simple(
                          src: image,
                          height: headderHeight,
                          type: typeImage,
                        ),
                        ClipPath(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          clipper: CardProfileClipper(
                            radius: BuddySitterMeasurement.sizeHalf,
                          ),
                          child: decoratorColorImage(containerInfo),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: headderHeight,
                      ),
                      child: MoleculeRowFLex.simple(
                        children: [
                          AtomButton.cicle(
                            colorHadler: (_) =>
                                Color(BuddySitterColor.light.value)
                                    .withOpacity(.3),
                            onPressed: actionLeft.onPressed,
                            onLongPress: actionLeft.onLongPress,
                            height: BuddySitterMeasurement.sizeHalf * 3,
                            icon: actionLeft.icon,
                            circleColor: null,
                            dotsColor: null,
                          ),
                          AtomImage.circle(
                            src: profile,
                            radius: BuddySitterMeasurement.sizeHalf * 1.8,
                            type: AtomImage.typeNetwork,
                          ),
                          AtomButton.cicle(
                            colorHadler: (_) =>
                                Color(BuddySitterColor.light.value)
                                    .withOpacity(.3),
                            onPressed: actionRight.onPressed,
                            onLongPress: actionRight.onLongPress,
                            height: BuddySitterMeasurement.sizeHalf * 3,
                            icon: actionRight.icon,
                            circleColor: null,
                            dotsColor: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // decoratorBorderRadius
    ); // decoratorMargin
  }
}

class AtomRanking extends StatelessWidget {
  const AtomRanking.stars({
    Key? key,
    required this.ranking,
  }) : super(key: key);

  final int ranking;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        10,
        (index) {
          if (index % 2 == 0) {
            return (index ~/ 2 <= ranking)
                ? Stack(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: BuddySitterColor.actionsWarning,
                      ),
                      Icon(
                        CupertinoIcons.star,
                        color: Colors.yellowAccent.shade700,
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: BuddySitterColor.dark.brighten(.6),
                      ),
                      Icon(
                        CupertinoIcons.star,
                        color: BuddySitterColor.dark.brighten(.5),
                      ),
                    ],
                  );
          }
          return SizedBox(
            width: BuddySitterMeasurement.sizeLeast,
          );
        },
      ),
    );
  }
}
