import 'package:buddy_sitter/presentation/pages/explore/explore.dart';
import 'package:buddy_sitter/presentation/pages/forgot_password/forgot_password.dart';
import 'package:buddy_sitter/presentation/pages/home/home.dart';
import 'package:buddy_sitter/presentation/pages/interfaces/interfaces.dart';
import 'package:buddy_sitter/presentation/pages/onboarding/onboarding.dart';
import 'package:buddy_sitter/presentation/pages/schedule/schedule.dart';
import 'package:buddy_sitter/presentation/pages/search_sitters/search_sitters.dart';
import 'package:buddy_sitter/presentation/pages/select_your_pet/select_your_pet.dart';
import 'package:buddy_sitter/presentation/pages/select_your_services/select_your_services.dart';
import 'package:buddy_sitter/presentation/pages/sign_in/sign_in.dart';
import 'package:buddy_sitter/presentation/pages/sign_up/sing_up.dart';
import 'package:buddy_sitter/presentation/pages/splash/splash.dart';
import 'package:buddy_sitter/presentation/pages/unknown/unknown.dart';
import 'package:flutter/material.dart';

import 'locations.dart';

class BuddySitterPage {
  static final Map<String, bool> _auth = Map.unmodifiable({
    BuddySitterLocation.splash: false,
    BuddySitterLocation.unknown: false,
    BuddySitterLocation.signIn: false,
    BuddySitterLocation.signup: false,
    BuddySitterLocation.onBoarding: false,
    BuddySitterLocation.explore: true,
    BuddySitterLocation.recoverPassword: true,
    BuddySitterLocation.home: true,
    BuddySitterLocation.selectYourPet: true,
    BuddySitterLocation.selectYourService: true,
    BuddySitterLocation.resultSitters: true,
    BuddySitterLocation.schedule: true,
    BuddySitterLocation.sitterSchedule: true,
    BuddySitterLocation.pendingServices: true,
    BuddySitterLocation.sitterServices: true,
    BuddySitterLocation.sitterProfile: true,
    BuddySitterLocation.petProfile: true,
    BuddySitterLocation.configSitterProfile: true,
    BuddySitterLocation.configPetProfile: true,
    BuddySitterLocation.addPet: true,
    BuddySitterLocation.sitterInfo: true,
    BuddySitterLocation.petInfo: true,
  });
  static final Map<String, BuddySitterPageProvider> _pages = Map.unmodifiable({
    BuddySitterLocation.splash: const Splash(),
    BuddySitterLocation.unknown: const Unknown(),
    BuddySitterLocation.signIn: const SignIn(),
    BuddySitterLocation.signup: const SignUp(),
    BuddySitterLocation.explore: const Explore(),
    BuddySitterLocation.onBoarding: const Onboarding(),
    BuddySitterLocation.recoverPassword: const RecoverPassword(),
    BuddySitterLocation.home: const Home(),
    BuddySitterLocation.selectYourPet: const SelectYourPet(),
    BuddySitterLocation.selectYourService: const SelectYourService(),
    BuddySitterLocation.resultSitters: const ResultSitters(),
    BuddySitterLocation.schedule: const Schedule(),
    BuddySitterLocation.sitterSchedule: const ResultSitters(),
    BuddySitterLocation.pendingServices: const ResultSitters(),
    BuddySitterLocation.sitterServices: const ResultSitters(),
    BuddySitterLocation.sitterProfile: const ResultSitters(),
    BuddySitterLocation.petProfile: const ResultSitters(),
    BuddySitterLocation.configSitterProfile: const ResultSitters(),
    BuddySitterLocation.configPetProfile: const ResultSitters(),
    BuddySitterLocation.addPet: const ResultSitters(),
    BuddySitterLocation.sitterInfo: const ResultSitters(),
    BuddySitterLocation.petInfo: const ResultSitters(),
  });

  static bool access(String location, Map state) {
    // TODO: manage access
    // print("_______________");
    // print("state $state");
    // print("location $location");
    // print("authorized ${_auth[location]}");

    return (_auth[location] ?? false) == state.containsKey("user");
    return true;
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
