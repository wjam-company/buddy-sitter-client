import 'package:buddy_sitter/presentation/utils/form/exporer_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/list_tile.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class SelectYourPet extends BuddySitterPageProvider<ProviderSelectYourPet> {
  const SelectYourPet({Key? key}) : super(key: key);

  @override
  ProviderSelectYourPet provider(BuildContext context) =>
      ProviderSelectYourPet();

  @override
  Widget appBarTitle(BuildContext context) {
    final FormProvider validators = FormProvider([
      ExploreValidator.search,
    ]);
    return Stack(
      children: [
        OrganismForm.column(
          padding: false,
          valid: false,
          provider: validators,
          fields: [
            MoleculeInput.text(
              autofocus: true,
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
            height: (BuddySitterMeasurement.sizeHigh) -
                ((BuddySitterText.content.fontSize as double) / 2),
            icon: Icon(
              Icons.search,
              color: BuddySitterColor.dark.brighten(.5),
            ),
          ),
        ),
      ],
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
              text: 'Chouse your pet',
              padding: EdgeInsets.zero,
            ),
          ),
          MoleculeListTile(
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjh5E6lDdlw5R7h6tiwcvuly5qfbRnrVV6tKrGc-bb1Zq-Mu1kbcwPgFIN0w_jKsAFbNo&usqp=CAU',
            title: 'Buster',
            content: 'Deserunt aqui magna',
            action: BuddySitterAction(
              text: 'Select',
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.check_mark_circled,
                color: BuddySitterColor.light,
              ),
            ),
          ),
          MoleculeListTile(
            image:
                'https://t3.ftcdn.net/jpg/02/95/94/94/360_F_295949484_8BrlWkTrPXTYzgMn3UebDl1O13PcVNMU.jpg',
            title: 'Magna',
            content: 'Deserunt aqui magna',
            action: BuddySitterAction(
              text: 'Select',
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.check_mark_circled,
                color: BuddySitterColor.light,
              ),
            ),
          ),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            icon: Icon(
              Icons.check,
              color: BuddySitterColor.actionsSuccess,
            ),
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: 'Continue',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
