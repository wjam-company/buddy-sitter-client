class BuddySitterPath {
  final bool _explore;
  final bool _splash;
  final bool _singin;
  final bool _unknown;
  final bool _onboarding;
  final bool _signup;
  final bool _home;
  final bool _recoverPassword;

  BuddySitterPath.splashArt()
      : _explore = false,
        _splash = true,
        _unknown = false,
        _singin = false,
        _onboarding = false,
        _signup = false,
        _home = false,
        _recoverPassword = false;
  BuddySitterPath.singin()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = true,
        _onboarding = false,
        _signup = false,
        _home = false,
        _recoverPassword = false;
  BuddySitterPath.explore()
      : _explore = true,
        _splash = false,
        _unknown = false,
        _singin = false,
        _onboarding = false,
        _signup = false,
        _home = false,
        _recoverPassword = false;
  BuddySitterPath.unknown()
      : _explore = false,
        _splash = false,
        _unknown = true,
        _singin = false,
        _onboarding = false,
        _signup = false,
        _home = false,
        _recoverPassword = false;

  BuddySitterPath.onboarding()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = false,
        _onboarding = true,
        _signup = false,
        _home = false,
        _recoverPassword = false;
  BuddySitterPath.signup()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = false,
        _onboarding = false,
        _signup = true,
        _home = false,
        _recoverPassword = false;
  BuddySitterPath.home()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = false,
        _onboarding = false,
        _signup = false,
        _home = true,
        _recoverPassword = false;
  BuddySitterPath.recoverPassword()
      : _explore = false,
        _splash = false,
        _unknown = false,
        _singin = false,
        _onboarding = false,
        _signup = false,
        _home = false,
        _recoverPassword = true;

  bool get isUnknownPage => _unknown;
  bool get isSplashPage => _splash;
  bool get isSinginPage => _singin;
  bool get isExplorePage => _explore;
  bool get isOnboardingPage => _onboarding;
  bool get isSignupPage => _signup;
  bool get isHomePage => _home;
  bool get isRecoverPasswordPage => _recoverPassword;

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
    // path: /onboarding
    if (uri.pathSegments.first == 'onboarding') {
      return BuddySitterPath.onboarding();
    }
    // path: /signup
    if (uri.pathSegments.first == 'signup') {
      return BuddySitterPath.signup();
    }
    // path: /home
    if (uri.pathSegments.first == 'home') {
      return BuddySitterPath.home();
    }
    // path: /signup
    if (uri.pathSegments.first == 'recover_password') {
      return BuddySitterPath.recoverPassword();
    }
    // path: 404
    return BuddySitterPath.unknown();
  }
}
