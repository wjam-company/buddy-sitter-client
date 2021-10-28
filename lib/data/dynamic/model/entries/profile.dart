import 'sitter.dart';

class Profile {
  final String id;
  final String? name;
  final int? idNumber;
  final String? idType;
  final String? address;
  final String? cellPhone;
  final DateTime? birthDate;
  final String? profilePicture;
  final String idUser;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Sitter? sitter;

  Profile({
    required this.id,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
    this.name,
    this.idNumber,
    this.idType,
    this.address,
    this.cellPhone,
    this.birthDate,
    this.profilePicture,
    this.sitter,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    Profile profile = Profile(
        name: json['name'],
        id: json['_id'],
        idNumber: json['id_number'],
        idType: json['id_type'],
        address: json['address'],
        cellPhone: json['cell_phone'],
        birthDate: json['birth_date'],
        profilePicture: json['profile_picture'],
        idUser: json['id_user'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        sitter: json['sitter'] != null ? Sitter(
          amountReviews: json['sitter']['amount_reviews'],
          animalsAgesAccepted: json['sitter']['animals_ages_accepted'],
          givenServices: json['sitter']['given_services'],
          lifeStyle: json['sitter']['life_style'],
          rating: json['sitter']['rating'],
          typeAnimalsAccepted: json['sitter']['type_animals_accepted'],
          typeServiceAccepted: json['sitter']['type_service_accepted'],
        ) : null);
    return profile;
  }
}
