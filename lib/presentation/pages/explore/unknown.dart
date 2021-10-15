import 'package:buddy_sitter/data/static/texts/sign_in.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/dot_indicator.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/onboarding.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Explore extends BuddySitterPageProvider {
  Explore({Key? key}) : super(key: key);

  @override
  ProviderOnboarding provider(BuildContext context) => ProviderOnboarding();

  @override
  Widget get appBarTitle => AtomText.content(
        text: DataTextSignIn.appBarTitle,
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
          MoleculeDotIndicator(
            color: BuddySitterColor.actionsSuccess.brighten(.3),
          ),
          OrganismOnboarding(
            color: BuddySitterColor.actionsLog,
          ),
          const Spacer(),
        ],
      ),
      childrenBottom: [],
    );
  }
}
