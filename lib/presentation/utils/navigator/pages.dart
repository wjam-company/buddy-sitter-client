import 'package:buddy_sitter/presentation/pages/explore/explore.dart';
import 'package:buddy_sitter/presentation/pages/forgot_password/forgot_password.dart';
import 'package:buddy_sitter/presentation/pages/home/home.dart';
import 'package:buddy_sitter/presentation/pages/interfaces/interfaces.dart';
import 'package:buddy_sitter/presentation/pages/onboarding/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/select_your_pet/select_your_pet.dart';
import 'package:buddy_sitter/presentation/pages/select_your_services/select_your_services.dart';
import 'package:buddy_sitter/presentation/pages/sign_in/sing_in.dart';
import 'package:buddy_sitter/presentation/pages/sign_up/sing_up.dart';
import 'package:buddy_sitter/presentation/pages/splash/splash.dart';
import 'package:buddy_sitter/presentation/pages/unknown/unknown.dart';
import 'package:flutter/material.dart';
import 'locations.dart';

class BuddySitterPage {
  static final Map<String, bool> _auth = Map.unmodifiable({
    BuddySitterLocation.splahs: false,
    BuddySitterLocation.unknown: false,
    BuddySitterLocation.signin: false,
    BuddySitterLocation.signup: false,
    BuddySitterLocation.onboarding: false,
    BuddySitterLocation.explore: true,
    BuddySitterLocation.recoverPassword: true,
    BuddySitterLocation.home: true,
    BuddySitterLocation.selectYourPet: true,
    BuddySitterLocation.selectYourService: true,
  });
  static final Map<String, BuddySitterPageProvider> _pages = Map.unmodifiable({
    BuddySitterLocation.splahs: const Splash(),
    BuddySitterLocation.unknown: const Unknown(),
    BuddySitterLocation.signin: const SignIn(),
    BuddySitterLocation.signup: const SignUp(),
    BuddySitterLocation.explore: const Explore(),
    BuddySitterLocation.onboarding: const Onboarding(),
    BuddySitterLocation.recoverPassword: const RecoverPassword(),
    BuddySitterLocation.home: const Home(),
    BuddySitterLocation.selectYourPet: const SelectYourPet(),
    BuddySitterLocation.selectYourService: const SelectYourService(),
  });

  static bool access(String location, bool state) {
    return (_auth[location] ?? false) == state;
  }

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
