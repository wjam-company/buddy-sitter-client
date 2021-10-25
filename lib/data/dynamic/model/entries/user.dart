class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final bool disable;
  final String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.disable,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'],
      username: json['username'],
      password: json['password'],
      disable: json['disable'],
      role: json['role'],
    );
  }
}
