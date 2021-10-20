import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './page_handler.dart' show RouterPageHandler;
import './path.dart' show BuddySitterPath;

class BuddySitterRouterDelegate extends RouterDelegate<BuddySitterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BuddySitterPath> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final RouterPageHandler _pageHandler = RouterPageHandler();

  BuddySitterRouterDelegate() {
    _pageHandler.addListener(notifyListeners);
  }

  @override
  BuddySitterPath? get currentConfiguration => _pageHandler.currentPath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _pageHandler,
      child: Consumer<RouterPageHandler>(
        builder: (context, pagueMananger, child) => Navigator(
          pages: List.of(_pageHandler.pages),
          onPopPage: _onPopPage,
        ),
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);

    if (!didPop || _pageHandler.canNotPop) {
      return false;
    }
    _pageHandler.didPop(route.settings as Page);
    return true;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(BuddySitterPath configuration) async =>
      await _pageHandler.setNewRoutePath(configuration);
}
