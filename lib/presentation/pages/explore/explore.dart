import 'dart:html';
import 'dart:ui';

import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Explore extends BuddySitterPageProvider<ProviderExplore> {
  const Explore({Key? key}) : super(key: key);

  @override
  ProviderExplore provider(BuildContext context) => ProviderExplore();

  @override
  Widget appBarTitle(BuildContext context) {
    return AtomButton.input(
      onPressed: () {},
      text: AtomText.content(text: 'Search'),
      icon: const Icon(Icons.search),
    );

    /*
    final FormProvider validators = FormProvider([
      ExploreValidator.search,
    ]);
    return Stack(
      children: [
        OrganismForm.column(
          provider: validators,
          fields: [
            MoleculeInput.text(
              entry: ExploreValidator.search,
              controler: validators.valid(
                ExploreValidator.search,
                validator: ExploreValidator.validSearch,
              ),
              text: 'Search',
            ),
          ],
        ),
        Positioned(
          right: BuddySitterMeasurement.sizeHalf,
          top: BuddySitterMeasurement.sizeHalf,
          child: AtomButton.cicle(
            onPressed: () {},
            height: BuddySitterMeasurement.sizeHigh,
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
    */
  }
// ,

  @override
  Widget body(_) => const BodyOnboarding();
}

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: ListView(
        children: [
          // Popus
          AtomSnack(
            caption: 'Badges',
            title: 'New Acount',
            icon: Icon(
              Icons.star_purple500_sharp,
              color: BuddySitterColor.actionsWarning,
            ),
            action: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: AtomText.subheading(text: 'Sitters'),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: BuddySitterMeasurement.sizeHalf / 2,
            ),
            height: BuddySitterMeasurement.sizeHigh * 4.5,
            child: ClipPath(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              clipper: CardPostClipper(
                radius: BuddySitterMeasurement.sizeHalf,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 2.0),
                        child: Image.network(
                          'https://statics-cuidateplus.marca.com/cms/mascotas_0.jpg',
                          height: BuddySitterMeasurement.sizeHigh * 3,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 2.0,
                          child: Container(
                            color: Colors.blue,
                            width: double.infinity,
                            child: Image.network(
                              'https://statics-cuidateplus.marca.com/cms/mascotas_0.jpg',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: BuddySitterMeasurement.sizeHigh * 1.45,
                        ),
                        child: ClipPath(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          clipper: CardProfileClipper(
                            radius: BuddySitterMeasurement.sizeHalf,
                          ),
                          child: Container(
                            color: BuddySitterColor.primaryBeige.brighten(.9),
                            height: BuddySitterMeasurement.sizeHigh * 3,
                            padding:
                                EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: BuddySitterMeasurement.sizeHigh,
                                ),
                                AtomText.subheading(
                                  text: 'Juanita',
                                  padding: EdgeInsets.zero,
                                  color: BuddySitterColor.dark,
                                ),
                                AtomText.content(
                                  text:
                                      'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est. ',
                                  padding: EdgeInsets.zero,
                                  color: BuddySitterColor.dark,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: BuddySitterMeasurement.sizeHalf * 4.45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                'https://i.scdn.co/image/ab6761610000e5eb567128259b78fea242010245',
                              ),
                              radius: BuddySitterMeasurement.sizeHalf * 1.8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor(Colors.transparent.value),
          child: AtomButton.bottom(
            text: AtomText.subheading(
              text: 'Menu',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) {
              return BuddySitterColor.actionsSuccess;
            },
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class AtomSnack extends StatelessWidget {
  final String caption;
  final String title;
  final Icon icon;
  final Function() action;
  const AtomSnack({
    Key? key,
    required this.caption,
    required this.title,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    Icon icon = 
    */
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf / 2,
      ),
      child: ClipRRect(
        borderRadius: BuddySitterMeasurement.borderRadiusHalf,
        child: Material(
          color: BuddySitterColor.complementaryBlue,
          child: InkWell(
            splashColor: /* splashColorHandler != null
                ? splashColorHandler!(<MaterialState>{})
                : */
                Color.lerp(
              Colors.transparent,
              BuddySitterColor.light,
              0.2,
            ),
            onTap: action,
            child: Padding(
              padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtomText.caption(
                        text: caption,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                      AtomText.subheading(
                        text: title,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                    ],
                  ),
                  const Spacer(),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  final double radius;
  final double leftTop = 0;
  final double leftBottom = 1;
  final double rightBottom = 2;
  final double rightTop = 3;
  const CustomClipperPath({required this.radius});

  void _curve(
    Path path, {
    required Point<double> start,
    required double radius,
    required double side,
    bool insert = false,
  }) {
    if (side > 3) {
      return;
    }
    Offset startCurve = Offset(start.x, start.y);
    if (!insert) {
      if (side == leftBottom) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x + radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightBottom) {
        path.lineTo(start.x - radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightTop) {
        path.lineTo(start.x, start.y + radius);
        Offset endCurve = Offset(start.x - radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == leftTop) {
        path.lineTo(start.x + radius, start.y);
        Offset endCurve = Offset(start.x, start.y + radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
    } else {
      if (side == leftBottom) {
        path.lineTo(start.x + radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightBottom) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x - radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == rightTop) {
        path.lineTo(start.x, start.y - radius);
        Offset endCurve = Offset(start.x + radius, start.y);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
      if (side == leftTop) {
        path.lineTo(start.x - radius, start.y);
        Offset endCurve = Offset(start.x, start.y - radius);
        path.quadraticBezierTo(
            startCurve.dx, startCurve.dy, endCurve.dx, endCurve.dy);
      }
    }
  }

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class CardProfileClipper extends CustomClipperPath {
  CardProfileClipper({required radius}) : super(radius: radius);
  @override
  Path getClip(Size size) {
    Path path = Path();
    double top = 0,
        bottom = size.height,
        left = 0,
        right = size.width,
        centerX = size.width * 0.5,
        centerY = size.height * 0.5;
    _curve(
      path,
      start: Point(left, bottom),
      radius: radius,
      side: leftBottom,
    );
    _curve(
      path,
      start: Point(right, bottom),
      radius: radius,
      side: rightBottom,
    );
    path.lineTo(right, top);

    final double radiusImage = (radius * 2);
    _curve(
      path,
      start: Point(centerX + radiusImage, top),
      radius: radius,
      side: leftTop,
    );
    _curve(
      path,
      start: Point(centerX + radiusImage, radiusImage * 1.9),
      radius: radiusImage,
      side: rightBottom,
      insert: true,
    );
    _curve(
      path,
      start: Point(centerX - radiusImage, radiusImage * 1.9),
      radius: radiusImage,
      side: leftBottom,
      insert: true,
    );
    _curve(
      path,
      start: Point(centerX - radiusImage, top),
      radius: radius,
      side: rightTop,
    );
    path.lineTo(left, top);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CardPostClipper extends CustomClipperPath {
  CardPostClipper({required radius}) : super(radius: radius);
  @override
  Path getClip(Size size) {
    Path path = Path();
    double top = 0, bottom = size.height, left = 0, right = size.width;

    path.lineTo(left, bottom);
    path.lineTo(right, bottom);

    _curve(
      path,
      start: Point(right, top),
      radius: radius,
      side: rightTop,
    );
    _curve(
      path,
      start: Point(left, top),
      radius: radius,
      side: leftTop,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
