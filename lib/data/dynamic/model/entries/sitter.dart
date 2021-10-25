class Sitter {
  final String id;
  final int givenServices;
  final double rating;
  final List<String> typeAnimalsAccepted;
  final List<String> animalsAgesAccepted;
  final List<String> typeServiceAccepted;
  final List<String> lifeStyle;
  final int amountReviews;

  Sitter({
    required this.givenServices,
    required this.rating,
    required this.typeAnimalsAccepted,
    required this.animalsAgesAccepted,
    required this.typeServiceAccepted,
    required this.lifeStyle,
    required this.amountReviews,
    required this.id,
  });

  factory Sitter.fromJson(Map<String, dynamic> json) {
    return Sitter(
      id: json['id'],
      amountReviews: json['amount_reviews'],
      animalsAgesAccepted: json['animals_ages_accepted'],
      givenServices: json['given_services'],
      lifeStyle: json['life_style'],
      rating: json['rating'],
      typeAnimalsAccepted: json['type_animals_accepted'],
      typeServiceAccepted: json['type_service_accepted'],
    );
  }
}
