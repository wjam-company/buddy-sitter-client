import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: AtomText.subheading(text: 'Sitters'),
          ),
          OrganismCard(),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor(Colors.transparent.value),
          child: const OrganismBarMenu(),
        ),
      ],
    );
  }
}

class OrganismBarMenu extends StatelessWidget {
  const OrganismBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoleculeRowFLex.action(
      height: BuddySitterMeasurement.sizeHalf * 3,
      actions: [
        ActionsRowFLex(
          onPressed: () =>
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.home, change: true),
          icon: Icon(
            CupertinoIcons.home,
            color: BuddySitterColor.actionsLog,
          ),
        ),
        ActionsRowFLex(
          onPressed: () =>
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.explore, change: true),
          icon: Icon(
            CupertinoIcons.search,
            color: BuddySitterColor.actionsLog,
          ),
        ),
        ActionsRowFLex(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.chat_bubble,
            color: BuddySitterColor.actionsLog,
          ),
        ),
      ],
    );
  }
}

class OrganismCard extends StatelessWidget {
  const OrganismCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                AtomImage.simple(
                  imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 2.0),
                  src:
                      'https://statics-cuidateplus.marca.com/cms/mascotas_0.jpg',
                  type: AtomImage.typeNetwork,
                  height: BuddySitterMeasurement.sizeHigh * 3,
                ),
                const AtomImage.aspectRatio(
                  aspectRatio: 2.0,
                  src:
                      'https://statics-cuidateplus.marca.com/cms/mascotas_0.jpg',
                  type: AtomImage.typeNetwork,
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
                      padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
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
                          const Spacer(),
                          AtomText.content(
                            text:
                                'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est. ',
                            padding: EdgeInsets.zero,
                            color: BuddySitterColor.dark,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: BuddySitterMeasurement.sizeHalf * 4.45),
                  child: MoleculeRowFLex.simple(
                    children: [
                      AtomButton.cicle(
                        onPressed: () {},
                        height: BuddySitterMeasurement.sizeHalf * 3,
                        icon: Icon(
                          CupertinoIcons.captions_bubble,
                          color: BuddySitterColor.actionsLog,
                        ),
                      ),
                      AtomImage.circle(
                        src:
                            'https://i.scdn.co/image/ab6761610000e5eb567128259b78fea242010245',
                        radius: BuddySitterMeasurement.sizeHalf * 1.8,
                        type: AtomImage.typeNetwork,
                      ),
                      AtomButton.cicle(
                        onPressed: () {},
                        height: BuddySitterMeasurement.sizeHalf * 3,
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: BuddySitterColor.complementaryRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionsRowFLex {
  final Icon icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  ActionsRowFLex({required this.icon, this.onPressed, this.onLongPress});
}

class MoleculeRowFLex extends StatelessWidget {
  final List<Widget>? children;
  final List<ActionsRowFLex>? actions;
  final double? height;
  const MoleculeRowFLex.simple({
    Key? key,
    required this.children,
    this.actions,
    this.height,
  }) : super(key: key);

  const MoleculeRowFLex.action({
    Key? key,
    this.children,
    required this.actions,
    required this.height,
  }) : super(key: key);

  List<dynamic> get currentList =>
      actions == null ? (children ?? []) : (actions ?? []);

  Widget decoratorAction(dynamic child) => child is Widget
      ? child
      : AtomButton.cicle(
          onPressed: child.onPressed,
          onLongPress: child.onLongPress,
          height: height, //BuddySitterMeasurement.sizeHalf * 3,
          icon: child.icon,
        );

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenFLex =
        List.generate((currentList.length * 2) + 1, (index) {
      if (index % 2 == 0) {
        return const Spacer();
      } else {
        return decoratorAction(currentList[index ~/ 2]);
      }
    });
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: childrenFLex);
  }
}

class AtomImage extends StatelessWidget {
  final double? aspectRatio;
  final String? src;
  final File? file;
  final Uint8List? bytes;
  final int type;
  final double? height;
  final double? width;
  final double? radius;
  final double? scale;
  final ImageFilter? imageFilter;
  static const int typeNetwork = 0;
  static const int typeAsset = 1;
  static const int typeFile = 2;
  static const int typeMemory = 3;
  const AtomImage.simple({
    Key? key,
    required this.type,
    this.src,
    this.aspectRatio,
    this.file,
    this.bytes,
    this.imageFilter,
    this.height,
    this.width,
    this.radius,
    this.scale,
  }) : super(key: key);
  const AtomImage.aspectRatio({
    Key? key,
    required this.aspectRatio,
    this.src,
    required this.type,
    this.file,
    this.bytes,
    this.imageFilter,
    this.height,
    this.width,
    this.radius,
    this.scale,
  }) : super(key: key);

  AtomImage.circle({
    Key? key,
    required this.radius,
    required this.type,
    this.aspectRatio,
    this.src,
    this.file,
    this.bytes,
    this.imageFilter,
    this.scale,
  })  : height =
            fromRadius(radius ?? BuddySitterMeasurement.sizeHalf, scale ?? 1.0),
        width =
            fromRadius(radius ?? BuddySitterMeasurement.sizeHalf, scale ?? 1.0),
        super(key: key);

  static double fromRadius(double radius, double scale) =>
      ((radius * scale) * 2.0);

  Image get getImage {
    switch (type) {
      case typeNetwork:
        return Image.network(
          src ?? '',
          height: height,
          width: width,
        );
      case typeAsset:
        return Image.asset(
          src ?? '',
          height: height,
          width: width,
        );
      case typeFile:
        assert(file != null, 'file no defined');
        assert(file is File, 'file need is defined with File');
        return Image.file(
          file as File,
          height: height,
          width: width,
        );
      case typeMemory:
        assert(bytes != null, 'bytes no defined');
        assert(bytes is Uint8List, 'byte need is defined with Uint8List');
        return Image.memory(
          bytes as Uint8List,
          height: height,
          width: width,
        );
      default:
        return Image.asset(
          src ?? '',
          height: height,
          width: width,
        );
    }
  }

  Widget decoratorFiltered(Widget child) => imageFilter != null
      ? ImageFiltered(
          imageFilter: imageFilter as ImageFilter,
          child: child,
        )
      : child;

  Widget decoratorAspectRatio(Widget child) => aspectRatio != null
      ? AspectRatio(
          aspectRatio: aspectRatio as double,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        )
      : child;

  Widget decoratorCircle(Widget child) {
    if (radius != null) {
      return ClipOval(
        child: SizedBox(
          width: (radius as double) * 2,
          height: (radius as double) * 2,
          child: child,
        ),
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return decoratorCircle(
      decoratorAspectRatio(
        decoratorFiltered(getImage),
      ), // decoratorAspectRatio
    ); // decoratorCircle
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
          color: BuddySitterColor.actionsLog.brighten(.3),
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
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
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
        centerX = size.width * 0.5;
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
