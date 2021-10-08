import 'package:buddy_sitter/presentation/pages/splash/splash.dart' show Splash;
import 'package:flutter/material.dart'
    show Widget, Page, MaterialPage, UniqueKey, Container;
import 'locations.dart' show BuddySitterLocation;

class BuddySitterPage {
  // ! TODO change Widget to abstract pages widget
  static final Map<String, Widget> _pages = Map.unmodifiable({
    BuddySitterLocation.splahs: const Splash(),
    BuddySitterLocation.unknown: Container(),
    BuddySitterLocation.signin: Container(),
    BuddySitterLocation.explore: Container(),
  });

  static int get length => _pages.length;

  static Page of(String url) => _pages.containsKey(url)
      ? MaterialPage(
          key: UniqueKey(),
          name: url,
          child: _pages[url] as Widget,
        )
      : MaterialPage(
          key: UniqueKey(),
          name: BuddySitterLocation.unknown,
          child: _pages[BuddySitterLocation.unknown] as Widget,
        );
}
