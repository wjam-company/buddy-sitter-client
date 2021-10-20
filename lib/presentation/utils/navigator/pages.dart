import 'package:buddy_sitter/presentation/pages/explore/explore.dart';
import 'package:buddy_sitter/presentation/pages/forgot_password/forgot_password.dart';
import 'package:buddy_sitter/presentation/pages/home/home.dart';
import 'package:buddy_sitter/presentation/pages/interfaces.dart';
import 'package:buddy_sitter/presentation/pages/onboarding/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/sign_in/sing_in.dart';
import 'package:buddy_sitter/presentation/pages/sign_up/sing_up.dart';
import 'package:buddy_sitter/presentation/pages/splash/splash.dart';
import 'package:buddy_sitter/presentation/pages/unknown/unknown.dart';
import 'package:flutter/material.dart';
import 'locations.dart';

class BuddySitterPage {
  static final Map<String, BuddySitterPageProvider> _pages = Map.unmodifiable({
    BuddySitterLocation.splahs: const Splash(),
    BuddySitterLocation.unknown: const Unknown(),
    BuddySitterLocation.signin: const SignIn(),
    BuddySitterLocation.signup: const SignUp(),
    BuddySitterLocation.explore: const Explore(),
    BuddySitterLocation.onboarding: const Onboarding(),
    BuddySitterLocation.recoverPassword: const RecoverPassword(),
    BuddySitterLocation.home: const Home(),
  });

  static final Map<String, BuddySitterPageProvider> _animationPage =
      Map.unmodifiable({
    BuddySitterLocation.recoverPassword: const RecoverPassword(),
  });

  static int get length => _pages.length;

  static Page of(String url) {
    if (_pages.containsKey(url)) {
      return MaterialPage(
        key: UniqueKey(),
        name: url,
        child: _pages[url] as BuddySitterPageProvider,
      );
    }
    return MaterialPage(
      key: UniqueKey(),
      name: BuddySitterLocation.unknown,
      child: _pages[BuddySitterLocation.unknown] as Widget,
    );
  }
}
