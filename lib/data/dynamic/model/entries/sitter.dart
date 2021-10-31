class Sitter {
  final int? givenServices;
  final double? rating;
  final List<String>? typeAnimalsAccepted;
  final List<String>? animalsAgesAccepted;
  final List<String>? typeServiceAccepted;
  final List<String>? lifeStyle;
  final int? amountReviews;

  Sitter({
    this.givenServices,
    this.rating,
    this.typeAnimalsAccepted,
    this.animalsAgesAccepted,
    this.typeServiceAccepted,
    this.lifeStyle,
    this.amountReviews,
  });

  factory Sitter.fromJson(Map<String, dynamic> json) {
    return Sitter(
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
