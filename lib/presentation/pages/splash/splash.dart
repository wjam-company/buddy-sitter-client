import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/pages/splash/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaHandler.of(context);
    return ChangeNotifierProvider<ProviderOnboarding>(
      create: (_) => ProviderOnboarding(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
