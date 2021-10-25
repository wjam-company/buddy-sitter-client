import 'owner.dart';
import 'sitter.dart';

class Profile {
  final String id;
  final String name;
  final int idNumber;
  final String idType;
  final String address;
  final String cellPhone;
  final DateTime birthDate;
  final String profilePicture;
  final String idUser;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Owner? owner;
  final Sitter? sitter;

  Profile({
    required this.id,
    required this.name,
    required this.idNumber,
    required this.idType,
    required this.address,
    required this.cellPhone,
    required this.birthDate,
    required this.profilePicture,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
    this.owner,
    this.sitter,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'],
        name: json['name'],
        idNumber: json['is_number'],
        idType: json['is_type'],
        address: json['address'],
        cellPhone: json['cell_phone'],
        birthDate: json['birth_date'],
        profilePicture: json['profile_picture'],
        idUser: json['id_user'],
        createdAt: DateTime(json['created_at']),
        updatedAt: DateTime(json['updated_at']),
        owner: Owner(
          id: json['id'],
          createdAt: DateTime(json['created_at']),
          updatedAt: DateTime(json['updated_at']),
        ),
        sitter: Sitter(
          id: json['id'],
          amountReviews: json['amount_reviews'],
          animalsAgesAccepted: json['animals_ages_accepted'],
          givenServices: json['given_services'],
          lifeStyle: json['life_style'],
          rating: json['rating'],
          typeAnimalsAccepted: json['type_animals_accepted'],
          typeServiceAccepted: json['type_service_accepted'],
        ));
  }
}
