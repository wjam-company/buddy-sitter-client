import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/list_tile.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interfaces/interfaces.dart';
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
          OrganismCard.list(
            actionLeft: BuddySitterAction(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                color: BuddySitterColor.actionsLog,
              ),
            ),
            actionRight: BuddySitterAction(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.shield,
                color: BuddySitterColor.complementaryRed,
              ),
            ),
            content:
                'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
            image:
                'https://cms.finnair.com/resource/blob/1393186/668fd19a69a530c7895e91940fe7803a/finnair-lapland-dog-woman-face-closeup-data.jpg?impolicy=crop&width=992&height=558&x=0&y=807&imwidth=768',
            name: 'Buster',
            profile:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjh5E6lDdlw5R7h6tiwcvuly5qfbRnrVV6tKrGc-bb1Zq-Mu1kbcwPgFIN0w_jKsAFbNo&usqp=CAU',
            children: const [
              MoleculeListTile.review(
                imageType: AtomImage.typeNetwork,
                content:
                    'Reprehenderit aliqua officia incididunt ad velit aliquip Lorem magna.',
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjh5E6lDdlw5R7h6tiwcvuly5qfbRnrVV6tKrGc-bb1Zq-Mu1kbcwPgFIN0w_jKsAFbNo&usqp=CAU',
                title: 'Sunt quis.',
                ranking: 4,
              ),
            ],
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
