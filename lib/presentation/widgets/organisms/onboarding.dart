import 'package:buddy_sitter/data/static/texts/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/splash/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OrganismOnboarding extends StatelessWidget {
  BuddySitterColor? color;

  OrganismOnboarding({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView.builder(
        onPageChanged: (index) {
          Provider.of<ProviderOnboarding>(context, listen: false).index = index;
        },
        itemCount: DataTextOnboarding.items.length,
        itemBuilder: (context, index) => MoleculeOnboardingCart(
          color: color,
          image: DataTextOnboarding.items[index]['img'] ?? '',
          text: DataTextOnboarding.items[index]['text'] ?? '',
          title: DataTextOnboarding.items[index]['title'] ?? '',
        ),
      ),
    );
  }
}
