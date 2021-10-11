import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'utils/navigator/router_information_parser.dart';
import 'utils/navigator/router_delegate.dart';

class BuddySitterApp extends StatelessWidget {
  const BuddySitterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaHandler.of(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      title: 'Buddy Sitter',
      theme: BuddySitterTheme.config,
      routeInformationParser: BuddySitterRouteInformationParser(),
      routerDelegate: BuddySitterRouterDelegate(),
    );
  }
}
