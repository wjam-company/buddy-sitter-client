class Login {
  final int accessToken;
  final int expiredIn;
  final int refreshToken;

  Login({
    required this.accessToken,
    required this.expiredIn,
    required this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      accessToken: json['access_token'],
      expiredIn: json['expired_ind'],
      refreshToken: json['refresh_token'],
    );
  }
}
