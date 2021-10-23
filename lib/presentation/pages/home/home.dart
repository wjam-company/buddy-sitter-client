import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Home extends BuddySitterPageProvider<ProviderHome> {
  const Home({Key? key}) : super(key: key);

  @override
  ProviderHome provider(BuildContext context) => ProviderHome();

  @override
  bool get haveAppBar => false;

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
          OrganismCard.headder(
            actionLeft: ActionsRowFLex(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                color: BuddySitterColor.actionsLog,
              ),
            ),
            actionRight: ActionsRowFLex(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.shield,
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
