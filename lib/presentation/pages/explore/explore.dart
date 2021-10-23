import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
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
      onPressed: () {
        Provider.of<RouterPageHandler>(context, listen: false)
            .show(BuddySitterLocation.selectYourPet);
      },
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
          OrganismCard.simple(
            actionLeft: ActionsRowFLex(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.captions_bubble,
                color: BuddySitterColor.actionsLog,
              ),
            ),
            actionRight: ActionsRowFLex(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart,
                color: BuddySitterColor.complementaryRed,
              ),
            ),
            content:
                'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
            image: 'https://statics-cuidateplus.marca.com/cms/mascotas_0.jpg',
            name: 'Juanita',
            profile:
                'https://i.scdn.co/image/ab6761610000e5eb567128259b78fea242010245',
          ),
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
