import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class Unknown extends BuddySitterPageProvider<Provider404> {
  const Unknown({Key? key}) : super(key: key);

  @override
  Provider404 provider(BuildContext context) => Provider404();

  @override
  Widget appBarTitle(_) => AtomText.headingLeast(
        text: '404',
        color: BuddySitterColor.primaryBeige,
      );

  @override
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
        text: 'No page found',
        color: BuddySitterColor.actionsSuccess.brighten(.3),
      ),
    );
  }
}
