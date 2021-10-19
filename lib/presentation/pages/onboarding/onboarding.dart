import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/dot_indicator.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/onboarding.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces.dart';
import './provider.dart';

class Onboarding extends BuddySitterPageProvider<ProviderOnboarding> {
  const Onboarding({Key? key}) : super(key: key);

  @override
  ProviderOnboarding provider(BuildContext context) => ProviderOnboarding();

  @override
  Widget appBarTitle(_) => AtomText.headingLeast(
        text: 'Buddy Sitter',
        color: BuddySitterColor.primaryBeige,
      );

  @override
  Widget body(_) => const Body();
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: Column(
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
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor(Colors.transparent.value),
          child: AtomButton.bottom(
            text: AtomText.subheading(
              text: 'Sign Up',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) {
              return BuddySitterColor.actionsSuccess;
            },
            onPressed: () =>
                Provider.of<RouterPageHandler>(context, listen: false)
                    .show(BuddySitterLocation.signup),
          ),
        ),
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            text: AtomText.subheading(
              text: 'Sign In',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) {
              return BuddySitterColor.actionsLog;
            },
            onPressed: () =>
                Provider.of<RouterPageHandler>(context, listen: false)
                    .show(BuddySitterLocation.signin),
          ),
        ),
      ],
    );
  }
}