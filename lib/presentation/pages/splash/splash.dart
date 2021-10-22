import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Splash extends BuddySitterPageProvider<ProviderSplash> {
  const Splash({Key? key}) : super(key: key);

  @override
  ProviderSplash provider(BuildContext context) => ProviderSplash();

  @override
  // ignore: avoid_renaming_method_parameters
  Widget appBarTitle(_) => AtomText.headingLeast(
        text: 'Buddy Sitter',
        color: BuddySitterColor.primaryBeige,
      );

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
    return Center(
      child: AtomText.headingHigh(
        text: 'Buddy Sitter',
        color: BuddySitterColor.actionsSuccess.brighten(.3),
      ),
    );
  }
}
