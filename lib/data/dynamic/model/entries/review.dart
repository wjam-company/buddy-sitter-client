class Review {
  final String id;
  final String serviceType;
  final String idReviewer;
  final String idReviewed;
  final String message;
  final int rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.serviceType,
    required this.idReviewer,
    required this.idReviewed,
    required this.message,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      serviceType: json['service_type'],
      idReviewer: json['id_reviewer'],
      idReviewed: json['id_reviewed'],
      message: json['message'],
      rating: json['rating'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
