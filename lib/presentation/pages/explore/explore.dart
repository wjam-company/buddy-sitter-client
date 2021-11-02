import 'package:buddy_sitter/data/static/mock/sitters.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/sitter_card.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider.dart';
import '../interfaces/interfaces.dart';

class Explore extends BuddySitterPageProvider<ProviderExplore> {
  const Explore({Key? key}) : super(key: key);

  @override
  ProviderExplore provider(BuildContext context) => ProviderExplore();

  @override
  Widget appBarTitle(BuildContext context) {
    return AtomButton.input(
      onPressed: () {
        Provider.of<RouterPageHandler>(context, listen: false)
            .show(BuddySitterLocation.selectYourPet);
      },
      text: AtomText.content(
        text: 'Search',
        padding: EdgeInsets.only(left: BuddySitterMeasurement.sizeHigh * .5),
      ),
      icon: Icon(
        Icons.search,
        color: BuddySitterColor.dark.brighten(.5),
      ),
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const Body();
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: ListView(
        children: [
          // Popus
          ListTile(
            //contentPadding: EdgeInsets.zero,
            leading: AtomText.subheading(
              text: 'Sitters',
              padding: EdgeInsets.zero,
            ),
          ),
          SitterCard(sitter: emma),
          SitterCard(sitter: charlotte),
          SitterCard(sitter: olivia),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.primaryPurple.brighten(.9),
          child: const OrganismBarMenu(),
        ),
      ],
    );
  }
}
