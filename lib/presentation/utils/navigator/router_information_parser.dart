import 'package:flutter/material.dart';

import './locations.dart';
import './path.dart';

class BuddySitterRouteInformationParser
    implements RouteInformationParser<BuddySitterPath> {
  @override
  Future<BuddySitterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return BuddySitterPath.parse(routeInformation.location);
  }

  @override
  RouteInformation? restoreRouteInformation(BuddySitterPath configuration) {
    if (configuration.isUnknownPage) {
      return const RouteInformation(
        location: BuddySitterLocation.unknown,
      );
    }
    if (configuration.isSplashPage) {
      return const RouteInformation(
        location: BuddySitterLocation.splash,
      );
    }
    if (configuration.isSinginPage) {
      return const RouteInformation(
        location: BuddySitterLocation.signIn,
      );
    }
    if (configuration.isExplorePage) {
      return const RouteInformation(
        location: BuddySitterLocation.explore,
      );
    }
    if (configuration.isOnboardingPage) {
      return const RouteInformation(
        location: BuddySitterLocation.onBoarding,
      );
    }
    if (configuration.isSignupPage) {
      return const RouteInformation(
        location: BuddySitterLocation.signup,
      );
    }
    if (configuration.isHomePage) {
      return const RouteInformation(
        location: BuddySitterLocation.home,
      );
    }
    if (configuration.isRecoverPasswordPage) {
      return const RouteInformation(
        location: BuddySitterLocation.recoverPassword,
      );
    }
  }
}
