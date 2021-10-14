import 'package:buddy_sitter/presentation/utils/media/media.dart';
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

class Splash extends BuddySitterPageProvider<ProviderOnboarding> {
  Splash({Key? key}) : super(key: key);

  @override
  ProviderOnboarding provider(BuildContext context) => ProviderOnboarding();

  @override
  Widget get appBarTitle => AtomText.headingLeast(
        text: 'Buddy Sitter',
        color: BuddySitterColor.primaryBeige,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
