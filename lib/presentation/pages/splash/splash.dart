import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../interfaces/interfaces.dart';
import './provider.dart';

class Splash extends BuddySitterPageProvider<ProviderSplash> {
  const Splash({Key? key}) : super(key: key);

  @override
  ProviderSplash provider(BuildContext context) => ProviderSplash();

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
    return Container(
      color: BuddySitterColor.primaryBeige,
      child: const Center(
        child: AtomImage.simple(
          type: AtomImage.typeAsset,
          src: 'assets/image/cat_dog.gif',
        ),
      ),
    );
  }
}
