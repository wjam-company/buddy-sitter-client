import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/router_information_parser.dart';
import './pages.dart';
import './path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './locations.dart';

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
      BuddySitterLocation.splahs,
      notify: false,
    );
    Future<void>.delayed(const Duration(seconds: 4), () {
      BuddySitterData().state.get().then((value) {
        show(
          // value ? BuddySitterLocation.explore : BuddySitterLocation.onboarding,
          value ? BuddySitterLocation.home : BuddySitterLocation.onboarding,
        );
        BuddySitterData().state.addListener(notifyListeners);
      });
    });
  }

  final List<Page> _pages = [];
  final List<Page> _authPages = [];

  List<Page> get _pagesActive =>
      BuddySitterData().state.syncGet() ? _authPages : _pages;

  BuddySitterPath get currentPath =>
      BuddySitterPath.parse(_pagesActive.last.name);

  set state(bool value) {
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
    List<Page> curentPages = stack ?? _pagesActive;
    if (curentPages.isNotEmpty &&
        (curentPages.last.name == buddySitterLocation)) {
      return;
    }

    if (change && curentPages.isNotEmpty) {
      curentPages.removeLast();
    }

    if (BuddySitterPage.access(
        buddySitterLocation, BuddySitterData().state.syncGet())) {
      curentPages.add(BuddySitterPage.of(buddySitterLocation));
    } else if (buddySitterLocation == BuddySitterLocation.splahs) {
      curentPages.add(BuddySitterPage.of(buddySitterLocation));
    } else {
      curentPages.add(BuddySitterPage.of(BuddySitterLocation.unknown));
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
