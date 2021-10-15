import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/onboarding/dot_indicator.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/onboarding.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces.dart';
import './provider.dart';

class Unknown extends BuddySitterPageProvider<ProviderOnboarding> {
  Unknown({Key? key}) : super(key: key);

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
