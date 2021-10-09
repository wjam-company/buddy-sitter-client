import 'package:buddy_sitter/data/static/texts/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/splash/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/animation.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TemplateActionBottom extends StatelessWidget {
  Widget child;
  TemplateActionBottom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: child,
          ),
          const AtomButton(),
        ],
      ),
    );
  }
}

// ,
class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        MoleculeDotIndicator(),
        OrganismOnboarding(),
        Spacer(),
      ],
    );
  }
}

class OrganismOnboarding extends StatelessWidget {
  const OrganismOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        onPageChanged: (index) {
          Provider.of<ProviderOnboarding>(context, listen: false).index = index;
        },
        itemCount: DataTextOnboarding.items.length,
        itemBuilder: (context, index) => MoleculeOnboardingCart(
          image: DataTextOnboarding.items[index]['img'] ?? '',
          text: DataTextOnboarding.items[index]['text'] ?? '',
          title: DataTextOnboarding.items[index]['title'] ?? '',
        ),
      ),
    );
  }
}

class MoleculeDotIndicator extends StatelessWidget {
  const MoleculeDotIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          DataTextOnboarding.items.length,
          (index) => AtomDotIndicator(
              index: index, length: DataTextOnboarding.items.length)),
    );
  }
}

class AtomButton extends StatelessWidget {
  const AtomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
                .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero),
          ),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => BuddySitterColor.actionsSuccess),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaHandler.proportionalWidth(mobile: 387.0),
            MediaHandler.proportionalHeight(mobile: 72.0),
          ),
        ),
      ),
      onPressed: () {},
      child: AtomText.subheading(
        text: 'Sign In',
        color: BuddySitterColor.light.brighten(0.5),
      ),
    );
  }
}

// ignore: must_be_immutable
class AtomDotIndicator extends StatelessWidget {
  final int index;
  final int length;
  double? _size;
  EdgeInsets? _margin;
  double? _height;
  BoxDecoration? _decoration;

  AtomDotIndicator({
    Key? key,
    required this.index,
    required this.length,
  }) : super(key: key);

  double get size {
    _size ??= MediaHandler.proportionalWidth(mobile: 377 / length) -
        (MediaHandler.proportionalWidth(mobile: 3) * (length * 2));
    return _size as double;
  }

  EdgeInsets get margin {
    _margin ??= EdgeInsets.symmetric(
        horizontal: MediaHandler.proportionalWidth(mobile: 3));
    return _margin as EdgeInsets;
  }

  double get height {
    _height ??= MediaHandler.proportionalWidth(mobile: 4);
    return _height as double;
  }

  BoxDecoration get decoration {
    _decoration ??= BoxDecoration(
      color: BuddySitterColor.primaryBeige.brighten(0.75),
      borderRadius: BorderRadius.circular(
        MediaHandler.proportionalWidth(mobile: 3),
      ),
    );
    return _decoration as BoxDecoration;
  }

  @override
  Widget build(BuildContext context) {
    final bool active = Provider.of<ProviderOnboarding>(context).index >= index;
    return Stack(children: [
      Container(
        margin: margin,
        height: height,
        width: size,
        decoration: decoration,
      ),
      AnimatedContainer(
        duration: BuddySitterAnimation.fast,
        margin: margin,
        height: height,
        width: active ? size : MediaHandler.proportionalWidth(mobile: 0),
        decoration: decoration.copyWith(color: BuddySitterColor.actionsSuccess),
      ),
    ]);
  }
}
