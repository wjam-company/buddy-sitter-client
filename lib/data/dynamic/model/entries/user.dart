class User {
  final String id;
  final String name;
  final String username;
  final String email;

  final String? idNumber;
  final String? idType;
  final String? address;
  final String? cellPhone;
  final String? birthDate;
  final String? profilePicture;
  final String? paymentStatus;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.idNumber,
    this.idType,
    this.address,
    this.cellPhone,
    this.birthDate,
    this.profilePicture,
    this.paymentStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      username: json['username'],
      idNumber: json['is_number'],
      idType: json['is_type'],
      address: json['address'],
      cellPhone: json['cell_phone'],
      birthDate: json['birth_date'],
      profilePicture: json['profile_picture'],
      paymentStatus: json['payment_status'],
    );
  }
}
