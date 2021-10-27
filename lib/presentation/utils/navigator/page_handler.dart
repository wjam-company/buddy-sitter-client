import 'package:buddy_sitter/presentation/utils/localstorage/localstorage.dart';
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
  late BuddySitterStorage _state;

  RouterPageHandler() {
    _state = BuddySitterStorage<bool>(type: 'log', initial: false);

    // show splash
    show(
      BuddySitterLocation.splahs,
      notify: false,
    );
    _state.get().then((value) {
      show(
        //value ? BuddySitterLocation.explore : BuddySitterLocation.onboarding,
        value
            ? BuddySitterLocation.resultSitters
            : BuddySitterLocation.onboarding,
      );
      _state.addListener(notifyListeners);
    });
  }

  final List<Page> _pages = [];
  final List<Page> _authPages = [];

  List<Page> get _pagesActive => _state.syncGet() ? _authPages : _pages;

  BuddySitterPath get currentPath =>
      BuddySitterPath.parse(_pagesActive.last.name);

  set state(bool value) {
    _state.set(value);
  }

  void show(
    String buddySitterLocation, {
    bool notify = true,
    bool change = false,
    List<Page>? stack,
  }) {
    List<Page> curentPages = stack ?? _pagesActive;
    if (change && curentPages.isNotEmpty) {
      curentPages.removeLast();
    }
    if (BuddySitterPage.access(buddySitterLocation, _state.syncGet())) {
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
