class Owner {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  Owner({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      createdAt: DateTime(json['created_at']),
      updatedAt: DateTime(json['updated_at']),
    );
  }
}
