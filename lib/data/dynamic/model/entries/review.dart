class Review {
  final String id;
  final String serviceType;
  final String message;
  final double rating;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.serviceType,
    required this.message,
    required this.rating,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      serviceType: json['service_type'],
      message: json['message'],
      rating: json['rating'],
      createdAt: DateTime(json['created_at']),
    );
  }
}
