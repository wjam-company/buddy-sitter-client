import 'dart:ui';

import 'package:buddy_sitter/presentation/utils/clipper/card.dart';
import 'package:buddy_sitter/presentation/utils/form/exporer_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
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
          AtomListTile(
            image:
                'https://static.toiimg.com/thumb/msid-67586673,width-800,height-600,resizemode-75,imgsize-3918697,pt-32,y_pad-40/67586673.jpg',
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
          AtomListTile(
            image:
                'https://images.indianexpress.com/2021/04/puppy-1903313_1280.jpg',
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

class AtomListTile extends StatelessWidget {
  final String image;
  final String title;
  final BuddySitterAction action;
  final String content;
  const AtomListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
        vertical: BuddySitterMeasurement.sizeHalf * 0.25,
      ),
      child: Row(
        //contentPadding: EdgeInsets.zero,
        children: [
          ClipPath(
            clipper: BorderRadiusClipper.all(
                radius: BuddySitterMeasurement.sizeHalf),
            child: SizedBox(
              width: BuddySitterMeasurement.sizeHigh * 1.5,
              height: BuddySitterMeasurement.sizeHigh * 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AtomImage.simple(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    height: double.infinity,
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat,
                    src: image,
                    type: AtomImage.typeNetwork,
                  ),
                  AtomImage.simple(
                    fit: BoxFit.cover,
                    src: image,
                    type: AtomImage.typeNetwork,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AtomText.headingLeast(
                  text: title,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: BuddySitterMeasurement.sizeHalf / 2,
                ),
                AtomText.content(
                  text: content,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(
                  height: BuddySitterMeasurement.sizeHalf / 2,
                ),
                ClipPath(
                  clipper: BorderRadiusClipper.all(
                    radius: BuddySitterMeasurement.sizeHalf,
                  ),
                  child: AtomButton.bottom(
                    text: AtomText.subheading(
                      text: action.text,
                      padding: EdgeInsets.symmetric(
                        vertical: BuddySitterMeasurement.sizeHalf -
                            (BuddySitterText.subheading.fontSize ?? 1) * .75,
                        horizontal: BuddySitterMeasurement.sizeHalf * 0.5,
                      ),
                      color: BuddySitterColor.light,
                    ),
                    onPressed: action.onPressed,
                    onLongPress: action.onLongPress,
                    colorHadler: (_) => BuddySitterColor.actionsLog,
                    height: BuddySitterMeasurement.sizeHigh,
                    icon: action.icon,
                    /*
                    */
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
