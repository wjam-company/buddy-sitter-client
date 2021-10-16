class Service {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String reviews;
  final DateTime startDate;
  final DateTime finishDate;
  final String typeService;
  final String idTransaction;
  final String userId;
  final String petId;
  final String sitterId;

  Service({
    required this.reviews,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startDate,
    required this.finishDate,
    required this.typeService,
    required this.idTransaction,
    required this.userId,
    required this.petId,
    required this.sitterId,
  });
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      finishDate: DateTime(json['finish_date']),
      idTransaction: json['id_transaction'],
      petId: json['pet_id'],
      reviews: json['reviews'],
      sitterId: json['sitter_id'],
      startDate: DateTime(json['start_date']),
      typeService: json['type_service'],
      userId: json['user_id'],
    );
  }
}
