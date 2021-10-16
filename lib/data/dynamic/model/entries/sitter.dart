class Sitter {
  final String id;
  final String name;
  final int idNumber;
  final String idType;
  final String address;
  final String cellPhone;
  final DateTime birthDate;
  final String profilePicture;
  final String certificationId;
  final int givenServices;
  final int rating;
  final String typeAnimalsAccepted;
  final String animalsAgesAccepted;
  final String ownPetsId;
  final String typeServiceAccepted;
  final String lifeStyle;
  final int amountReviews;
  final DateTime availability;
  final DateTime createdAt;
  final DateTime updatedAt;

  Sitter({
    required this.certificationId,
    required this.givenServices,
    required this.rating,
    required this.typeAnimalsAccepted,
    required this.animalsAgesAccepted,
    required this.ownPetsId,
    required this.typeServiceAccepted,
    required this.lifeStyle,
    required this.amountReviews,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.idNumber,
    required this.idType,
    required this.address,
    required this.cellPhone,
    required this.birthDate,
    required this.profilePicture,
  });

  factory Sitter.fromJson(Map<String, dynamic> json) {
    return Sitter(
      id: json['id'],
      name: json['name'],
      idNumber: json['is_number'],
      idType: json['is_type'],
      address: json['address'],
      cellPhone: json['cell_phone'],
      birthDate: json['birth_date'],
      profilePicture: json['profile_picture'],
      amountReviews: json['amount_reviews'],
      animalsAgesAccepted: json['animals_ages_accepted'],
      availability: json['availability'],
      certificationId: json['certification_id'],
      createdAt: json['created_at'],
      givenServices: json['given_services'],
      lifeStyle: json['life_style'],
      ownPetsId: json['own_pets_id'],
      rating: json['rating'],
      typeAnimalsAccepted: json['type_animals_accepted'],
      typeServiceAccepted: json['type_service_accepted'],
      updatedAt: json['updated_at'],
    );
  }
}
