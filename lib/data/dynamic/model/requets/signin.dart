class SignInDTO {
  final String email;
  final String password;

  SignInDTO({
    required this.email,
    required this.password,
  });

  factory SignInDTO.fromJson(Map<String, dynamic> json) {
    return SignInDTO(
      email: json['email'],
      password: json['password'],
    );
  }
}
