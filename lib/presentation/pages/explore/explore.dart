import 'package:buddy_sitter/data/static/texts/sign_in.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/dot_indicator.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/onboarding.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Explore extends BuddySitterPageProvider<ProviderExplore> {
  const Explore({Key? key}) : super(key: key);

  @override
  ProviderExplore provider(BuildContext context) => ProviderExplore();

  @override
  Widget get appBarTitle => AtomText.content(
        text: 'Explore',
        color: BuddySitterColor.dark.brighten(0.3),
      );

  @override
  Widget get body => const BodyOnboarding();
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
          AtomText.headingHalf(text: 'Explore'),
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
              onPressed: () {}),
        ),
      ],
    );
  }
}
