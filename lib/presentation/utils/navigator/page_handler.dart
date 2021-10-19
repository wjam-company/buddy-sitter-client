import 'package:buddy_sitter/presentation/utils/localstorage/localstorage.dart';
import './pages.dart';
import './path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './locations.dart';

class RouterPageHandler extends ChangeNotifier {
  static RouterPageHandler of(BuildContext context) =>
      Provider.of<RouterPageHandler>(context, listen: false);

  List<Page> get pages => List.unmodifiable(_pagesPreLoad + _pagesActive);
  late BuddySitterStorage _state;

  RouterPageHandler() {
    if (BuddySitterPage.length != BuddySitterLocation.length) {
      throw Error();
    }
    _state = BuddySitterStorage<bool>(type: 'log', initial: false);

    // show splash
    show(
      BuddySitterLocation.splahs,
      preLoads: [
        BuddySitterLocation.explore,
        BuddySitterLocation.onboarding,
      ],
      notify: false,
    );
    _state.get().then((value) {
      if (value) {
        show(
          BuddySitterLocation.explore,
          stack: _authPages,
        );
      } else {
        show(
          BuddySitterLocation.onboarding,
          stack: _pages,
          preLoads: [
            BuddySitterLocation.signin,
            BuddySitterLocation.signup,
          ],
        );
      }
      _state.addListener(notifyListeners);
    });
  }

  final List<Page> _pages = [];
  final List<Page> _authPages = [];
  final List<Page> _pagesPreLoad = [];

  List<Page> get _pagesActive => _state.syncGet() ? _authPages : _pages;

  BuddySitterPath get currentPath =>
      BuddySitterPath.parse(_pagesActive.last.name);

  set state(bool value) {
    _state.set(value);
  }

  void show(
    String buddySitterLocation, {
    List<String>? preLoads,
    String? preLoad,
    bool notify = true,
    List<Page>? stack,
  }) {
    List<Page> curentPages = stack ?? _pagesActive;
    int index = _pagesPreLoad
        .indexWhere((element) => buddySitterLocation == element.name);
    if (index == -1) {
      curentPages.add(BuddySitterPage.of(buddySitterLocation));
    } else {
      Page<dynamic> page = _pagesPreLoad.removeAt(index);
      curentPages.add(page);
    }

    _pagesPreLoad.clear();
    if (preLoads != null) {
      _pagesPreLoad.addAll(
        preLoads.map(
          (location) => BuddySitterPage.of(location),
        ), // preLoad.map
      ); // _pagesPreLoad.addAll
    }
    if (preLoad != null) {
      _pagesPreLoad.add(BuddySitterPage.of(preLoad));
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
    if (configuration.isUnknownPage) {
      // ! TODO logic when change the route inthe browser
    }
  }
}
