import 'package:flutter/material.dart';
import './path.dart';
import './locations.dart';

class BuddySitterRouteInformationParser
    implements RouteInformationParser<BuddySitterPath> {
  @override
  Future<BuddySitterPath> parseRouteInformation(
          RouteInformation routeInformation) async =>
      BuddySitterPath.parse(routeInformation.location);
  @override
  RouteInformation? restoreRouteInformation(BuddySitterPath configuration) {
    if (configuration.isUnknownPage) {
      return const RouteInformation(location: BuddySitterLocation.unknown);
    }
    if (configuration.isSplashPage) {
      return const RouteInformation(location: BuddySitterLocation.splahs);
    }
    if (configuration.isSinginPage) {
      return const RouteInformation(location: BuddySitterLocation.signin);
    }
    if (configuration.isExplorePague) {
      return const RouteInformation(location: BuddySitterLocation.explore);
    }
  }
}
