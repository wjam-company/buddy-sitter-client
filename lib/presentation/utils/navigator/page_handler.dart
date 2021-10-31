import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/router_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './locations.dart';
import './pages.dart';
import './path.dart';

class RouterPageHandler extends ChangeNotifier {
  static BuddySitterRouteInformationParser routeInformationParser =
      BuddySitterRouteInformationParser();

  static RouterPageHandler of(BuildContext context) =>
      Provider.of<RouterPageHandler>(context, listen: false);

  List<Page> get pages => List.unmodifiable(_pagesActive);

  RouterPageHandler() {
    BuddySitterData();
    // show splash
    show(
      BuddySitterLocation.splash,
      notify: false,
    );
    Future<void>.delayed(const Duration(seconds: 4), () {
      var map = BuddySitterData().state.syncGet();
      print("______");
      print("splash map $map");
      print("______");
      BuddySitterData().state.get().then((value) {
        bool? isAuth = value?.containsKey("user") == true;
        print("splash state $value");
        print("splash auth: $isAuth");
        show(
          // value ? BuddySitterLocation.explore : BuddySitterLocation.onBoarding,
          // TODO: fix state login
          isAuth ? BuddySitterLocation.home : BuddySitterLocation.onBoarding,
        );
        BuddySitterData().state.addListener(notifyListeners);
      });
    });
  }

  final List<Page> _pages = [];
  final List<Page> _authPages = [];

  // TODO:
  List<Page> get _pagesActive {
    var map = BuddySitterData().state.syncGet();
    return BuddySitterData().state.syncGet().isNotEmpty ? _authPages : _pages;
    // BuddySitterData().state.syncGet().isNotEmpty ? _authPages : _pages;
  }

  BuddySitterPath get currentPath =>
      BuddySitterPath.parse(_pagesActive.last.name);

  set state(Map value) {
    BuddySitterData().state.set(value);
  }

  String get active =>
      _pagesActive.isNotEmpty ? _pagesActive.last.name ?? '' : '';

  void show(
    String buddySitterLocation, {
    bool notify = true,
    bool change = false,
    List<Page>? stack,
  }) {
    List<Page> currentPages = stack ?? _pagesActive;
    if (currentPages.isNotEmpty &&
        (currentPages.last.name == buddySitterLocation)) {
      return;
    }

    if (change && currentPages.isNotEmpty) {
      currentPages.removeLast();
    }

    if (BuddySitterPage.access(
        buddySitterLocation, BuddySitterData().state.syncGet())) {
      currentPages.add(BuddySitterPage.of(buddySitterLocation));
    } else if (buddySitterLocation == BuddySitterLocation.splash) {
      currentPages.add(BuddySitterPage.of(buddySitterLocation));
    } else {
      currentPages.add(BuddySitterPage.of(BuddySitterLocation.unknown));
    }

    if (notify) {
      notifyListeners();
    }
  }

  void didPop(Page page) {
    _pagesActive.remove(page);
    notifyListeners();
  }

  bool get canNotPop => _pagesActive.length < 2;

  bool get canPop => _pagesActive.length >= 2;

  Future<void> setNewRoutePath(BuddySitterPath configuration) async {
    RouteInformation? routeInformation =
        routeInformationParser.restoreRouteInformation(configuration);
    String location = routeInformation?.location ?? '/404';
    show(location);
  }
}
