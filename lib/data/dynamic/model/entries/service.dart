import 'owner.dart';
import 'pet.dart';
import 'review.dart';
import 'sitter.dart';

class Service {
  final String id;
  final DateTime startDate;
  final DateTime finishDate;
  final String typeService;
  final String idTransaction;
  final List<Review> listReviews;
  final Owner owner;
  final List<Pet> listPets;
  final Sitter sitter;
  final DateTime createdAt;
  final DateTime updatedAt;

  Service({
    required this.listReviews,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startDate,
    required this.finishDate,
    required this.typeService,
    required this.idTransaction,
    required this.owner,
    required this.listPets,
    required this.sitter,
  });
  factory Service.fromJson(Map<String, dynamic> json) {
    List<Review> listOfReviews = [];
    for (var review in json['reviews']) {
      listOfReviews.add(Review(
        id: review['id'],
        serviceType: review['service_type'],
        message: review['message'],
        rating: review['rating'],
        createdAt: DateTime(review['created_at']),
      ));
    }
    List<Pet> listOfPets = [];
    for (var pet in json['pets']) {
      listOfPets.add(Pet(
        id: pet['id'],
        name: pet['name'],
        observations: pet['observations'],
        vaccinationationCard: pet['vaccination_card'],
        walkFrequencyPerDay: pet['walk_frequency'],
        weight: pet['weight'],
        bathroomHours: json['bathroom_hours'],
        bathroomTimes: json['bathroom_times'],
        bathroomType: json['bathroom_type'],
        birthDate: DateTime(pet['birth_date']),
        breed: pet['breed'],
        diet: pet['diet'],
        disabilities: pet['disabilities'],
        gender: pet['gender'],
        healthStatus: pet['health_status'],
        mealHours: pet['meal_hours'],
        prevSurgeries: pet['prev_surgeries'],
        typeAnimal: pet['type_animal'],
        vetsName: pet['vets_name'],
        vetsPhone: pet['vets_phone'],
        idOwner: pet['id_owner'],
        createdAt: pet['created_at'],
        updatedAt: pet['updated_at'],
      ));
    }
    return Service(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      finishDate: DateTime(json['finish_date']),
      idTransaction: json['id_transaction'],
      listPets: json[listOfPets],
      listReviews: json[listOfReviews],
      sitter: Sitter(
        amountReviews: json['amount_reviews'],
        animalsAgesAccepted: json['animals_ages_accepted'],
        givenServices: json['given_services'],
        lifeStyle: json['life_style'],
        rating: json['rating'],
        typeAnimalsAccepted: json['type_animals_accepted'],
        typeServiceAccepted: json['type_service_accepted'],
      ),
      startDate: DateTime(json['start_date']),
      typeService: json['type_service'],
      owner: Owner(
        id: json['id'],
        createdAt: DateTime(json['created_at']),
        updatedAt: DateTime(json['updated_at']),
      ),
    );
  }
}
