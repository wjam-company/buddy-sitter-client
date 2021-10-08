class BuddySitterPath {
  final bool _explore;
  final bool _splash;
  final bool _singin;
  final bool _unknown;

  BuddySitterPath.splashArt()
      : _explore = false,
        _splash = true,
        _unknown = false,
        _singin = false;
  BuddySitterPath.singin()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = true;
  BuddySitterPath.explore()
      : _explore = true,
        _splash = false,
        _unknown = false,
        _singin = false;
  BuddySitterPath.unknown()
      : _explore = false,
        _splash = false,
        _unknown = true,
        _singin = false;

  bool get isExplorePague => _explore;
  bool get isSplashPage => _splash;
  bool get isSinginPage => _singin;
  bool get isUnknownPage => _unknown;

  static BuddySitterPath parse(String? url) {
    final Uri uri = Uri.parse(url ?? '');

    // path: /
    if (uri.pathSegments.isEmpty) {
      return BuddySitterPath.splashArt();
    }
    // path: /signin
    if (uri.pathSegments.first == 'signin') {
      return BuddySitterPath.singin();
    }
    // path: /explore
    if (uri.pathSegments.first == 'explore') {
      return BuddySitterPath.explore();
    }
    // path: 404
    return BuddySitterPath.unknown();
  }
}
