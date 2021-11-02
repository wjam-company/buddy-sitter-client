import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './provider.dart';
import '../interfaces/interfaces.dart';
import 'home_body.dart';

class Home extends BuddySitterPageProvider<ProviderHome> {
  const Home({Key? key}) : super(key: key);

  @override
  ProviderHome provider(BuildContext context) => ProviderHome();

  @override
  bool get haveAppBar => false;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const HomeBody();
}
