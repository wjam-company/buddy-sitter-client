import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces/interfaces.dart';
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
            typeImage: AtomImage.typeAsset,
            actionLeft: BuddySitterAction(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.captions_bubble,
                color: BuddySitterColor.actionsLog,
              ),
            ),
            actionRight: BuddySitterAction(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart,
                color: BuddySitterColor.complementaryRed,
              ),
            ),
            content:
                'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
            image:
                'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
            name: 'Juanita',
            profile:
                'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
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
