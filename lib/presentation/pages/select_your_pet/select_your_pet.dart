import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
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
    return AtomButton.input(
      onPressed: () {},
      text: AtomText.content(text: 'Search'),
      icon: const Icon(Icons.search),
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
          Row(
            //contentPadding: EdgeInsets.zero,
            children: [
              AtomImage.circle(
                fit: BoxFit.none,
                src:
                    'https://static.toiimg.com/thumb/msid-67586673,width-800,height-600,resizemode-75,imgsize-3918697,pt-32,y_pad-40/67586673.jpg',
                radius: BuddySitterMeasurement.sizeHalf,
                scale: 2.0,
                type: AtomImage.typeNetwork,
              ),
              AtomText.subheading(
                text: 'Sitters',
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          ListTile(
            //contentPadding: EdgeInsets.zero,
            title: AtomText.subheading(
              text: 'Sitters',
              padding: EdgeInsets.zero,
            ),
            leading: AtomImage.circle(
              src:
                  'https://images.indianexpress.com/2021/04/puppy-1903313_1280.jpg',
              radius: BuddySitterMeasurement.sizeHalf,
              type: AtomImage.typeNetwork,
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
