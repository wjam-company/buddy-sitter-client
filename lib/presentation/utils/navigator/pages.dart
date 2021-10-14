import 'package:buddy_sitter/presentation/pages/explore/unknown.dart';
import 'package:buddy_sitter/presentation/pages/forgot_password/forgot_password.dart';
import 'package:buddy_sitter/presentation/pages/interfaces.dart';
import 'package:buddy_sitter/presentation/pages/sign_in/sing_in.dart';
import 'package:buddy_sitter/presentation/pages/sign_up/sing_up.dart';
import 'package:buddy_sitter/presentation/pages/splash/splash.dart';
import 'package:buddy_sitter/presentation/pages/unknown/unknown.dart';
import 'package:flutter/material.dart';
import 'locations.dart';

class BuddySitterPage {
  static final Map<String, BuddySitterPageProvider> _pages = Map.unmodifiable({
    BuddySitterLocation.splahs: Splash(),
    BuddySitterLocation.unknown: Unknown(),
    BuddySitterLocation.signin: SignIn(),
    BuddySitterLocation.signup: SignUp(),
    BuddySitterLocation.explore: Explore(),
    BuddySitterLocation.recoverPassword: RecoverPassword(),
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
