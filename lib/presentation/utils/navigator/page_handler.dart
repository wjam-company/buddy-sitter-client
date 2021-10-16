import './pages.dart';
import './path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './locations.dart';

class RouterPageHandler extends ChangeNotifier {
  static RouterPageHandler of(BuildContext context) =>
      Provider.of<RouterPageHandler>(context, listen: false);

  List<Page> get pages => List.unmodifiable(_pagesPreLoad + _pages);

  RouterPageHandler() {
    if (BuddySitterPage.length != BuddySitterLocation.length) {
      throw Error();
    }
    show(
      BuddySitterLocation.splahs,
      preLoads: [
        BuddySitterLocation.signin,
        BuddySitterLocation.signup,
      ],
      notify: false,
    );
  }

  final List<Page> _pages = [];
  final List<Page> _pagesPreLoad = [];

  BuddySitterPath get currentPath => BuddySitterPath.parse(_pages.last.name);

  void show(
    String buddySitterLocation, {
    List<String>? preLoads,
    String? preLoad,
    bool notify = true,
  }) {
    int index = _pagesPreLoad
        .indexWhere((element) => buddySitterLocation == element.name);
    if (index == -1) {
      _pages.add(BuddySitterPage.of(buddySitterLocation));
    } else {
      Page<dynamic> page = _pagesPreLoad.removeAt(index);
      _pages.add(page);
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
    _pages.remove(page);
    notifyListeners();
  }

  bool get canNotPop => _pages.length < 2;
  bool get canPop => _pages.length >= 2;

  Future<void> setNewRoutePath(BuddySitterPath configuration) async {
    if (configuration.isUnknownPage) {
      // ! TODO logic when change the route inthe browser
    }
  }
}
