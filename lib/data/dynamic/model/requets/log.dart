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

  static List<Login> fromJsonList(List<Map<String, dynamic>> jsons) {
    List<Login> loginsGenerate = List.generate(
      jsons.length,
      (index) => Login(
        accessToken: jsons[index]['access_token'],
        expiredIn: jsons[index]['expired_ind'],
        refreshToken: jsons[index]['refresh_token'],
      ),
    );

    List<Login> logins = [];
    for (final json in jsons) {
      logins.add(
        Login(
          accessToken: json['access_token'],
          expiredIn: json['expired_ind'],
          refreshToken: json['refresh_token'],
        ),
      );
    }
    return logins;
  }
}
