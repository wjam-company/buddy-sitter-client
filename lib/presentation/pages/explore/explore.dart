import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Explore extends BuddySitterPageProvider<ProviderExplore> {
  const Explore({Key? key}) : super(key: key);

  @override
  ProviderExplore provider(BuildContext context) => ProviderExplore();

  @override
  Widget appBarTitle(BuildContext context) {
    return AtomButton.input(
      onPressed: () {},
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
  Widget body(_) => const BodyOnboarding();
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
          // Popus
          AtomSnack(
            caption: 'Badges',
            title: 'New Acount',
            icon: Icon(
              Icons.star_purple500_sharp,
              color: BuddySitterColor.actionsWarning,
            ),
            action: () {},
          ),
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class AtomSnack extends StatelessWidget {
  final String caption;
  final String title;
  final Icon icon;
  final Function() action;
  const AtomSnack({
    Key? key,
    required this.caption,
    required this.title,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    Icon icon = 
    */
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf / 2,
      ),
      child: ClipRRect(
        borderRadius: BuddySitterMeasurement.borderRadiusHalf,
        child: Material(
          color: BuddySitterColor.complementaryBlue,
          child: InkWell(
            splashColor: /* splashColorHandler != null
                ? splashColorHandler!(<MaterialState>{})
                : */
                Color.lerp(
              Colors.transparent,
              BuddySitterColor.light,
              0.2,
            ),
            onTap: action,
            child: Padding(
              padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtomText.caption(
                        text: caption,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                      AtomText.subheading(
                        text: title,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                    ],
                  ),
                  const Spacer(),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
