import './pages.dart';
import './path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './locations.dart';

class RouterPageHandler extends ChangeNotifier {
  static RouterPageHandler of(BuildContext context) =>
      Provider.of<RouterPageHandler>(context, listen: false);

  List<Page> get pages => List.unmodifiable(_pages);

  RouterPageHandler() {
    if (BuddySitterPage.length != BuddySitterLocation.length) {
      throw Error();
    }
    _pages.add(BuddySitterPage.of(BuddySitterLocation.splahs));
  }

  final List<Page> _pages = [];

  BuddySitterPath get currentPath => BuddySitterPath.parse(_pages.last.name);

  void toSignIn() {
    _pages.add(BuddySitterPage.of(BuddySitterLocation.signin));
    notifyListeners();
  }

  void didPop(Page pague) {
    _pages.remove(pague);
    notifyListeners();
  }

  Future<void> setNewRoutePath(BuddySitterPath configuration) async {
    if (configuration.isUnknownPage) {
      // ! TODO logic when change the route inthe browser
    }
  }
}
