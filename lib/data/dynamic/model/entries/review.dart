import 'profile.dart';
import 'sitter.dart';

class Review {
  final String? id;
  final String serviceType;
  final String message;
  final double rating;
  final DateTime? createdAt;
  final Profile? owner;
  final Profile? sitter;

  Review({
    this.id,
    required this.serviceType,
    required this.message,
    required this.rating,
    this.createdAt,
    this.owner,
    this.sitter,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json['id'],
        serviceType: json['service_type'],
        message: json['message'],
        rating: json['rating'],
        createdAt: DateTime.parse(json['created_at']),
        sitter: Profile(
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
            sitter: Sitter(
              amountReviews: json['sitter']['amount_reviews'],
              animalsAgesAccepted: json['sitter']['animals_ages_accepted'],
              givenServices: json['sitter']['given_services'],
              lifeStyle: json['sitter']['life_style'],
              rating: json['sitter']['rating'],
              typeAnimalsAccepted: json['sitter']['type_animals_accepted'],
              typeServiceAccepted: json['sitter']['type_service_accepted'],
            )),
        owner: Profile(
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
        ));
  }
}
