import 'package:buddy_sitter/data/static/texts/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/splash/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/animation.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (index) {
                Provider.of<ProviderOnboarding>(context, listen: false).index =
                    index;
              },
              itemCount: DataTextOnboarding.items.length,
              itemBuilder: (context, index) => MoleculeOnboardingCart(
                image: DataTextOnboarding.items[index]['img'] ?? '',
                text: DataTextOnboarding.items[index]['text'] ?? '',
                title: DataTextOnboarding.items[index]['title'] ?? '',
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(DataTextOnboarding.items.length,
                      (index) => AtomDotIndicator(index: index)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AtomDotIndicator extends StatelessWidget {
  final int index;
  const AtomDotIndicator({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool active = index == Provider.of<ProviderOnboarding>(context).index;
    return AnimatedContainer(
      duration: BuddySitterAnimation.fast,
      margin: active
          ? EdgeInsets.symmetric(
              horizontal: MediaHandler.proportionalWidth(mobile: 0))
          : EdgeInsets.symmetric(
              horizontal: MediaHandler.proportionalWidth(mobile: 3)),
      height: MediaHandler.proportionalWidth(mobile: 6),
      width: active
          ? MediaHandler.proportionalWidth(mobile: 12)
          : MediaHandler.proportionalWidth(mobile: 6),
      decoration: BoxDecoration(
        color: active
            ? BuddySitterColor.primaryBeige
            : BuddySitterColor.complementaryRed.withOpacity(0.3),
        borderRadius: BorderRadius.circular(
          MediaHandler.proportionalWidth(mobile: 3),
        ),
      ),
    );
  }
}
