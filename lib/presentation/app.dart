import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'utils/navigator/router_information_parser.dart';
import 'utils/navigator/router_delegate.dart';
/*
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
*/

class BuddySitterApp extends StatefulWidget {
  const BuddySitterApp({Key? key}) : super(key: key);

  @override
  State<BuddySitterApp> createState() => _BuddySitterApp();
}

class _BuddySitterApp extends State<BuddySitterApp>
    with WidgetsBindingObserver {
  late BuddySitterRouteInformationParser routeInformationParser;
  // late BuddySitterRouterDelegate routerDelegate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    routeInformationParser = BuddySitterRouteInformationParser();
    //routerDelegate = BuddySitterRouterDelegate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaHandler.of(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      title: 'Buddy Sitter',
      theme: BuddySitterTheme.config,
      routeInformationParser: routeInformationParser,
      routerDelegate: BuddySitterRouterDelegate(),
    );
  }
}
