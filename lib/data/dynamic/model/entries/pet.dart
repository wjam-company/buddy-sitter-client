class Pet {
  final String? id;
  final String name;
  final String? vaccinationationCard;
  final String? observations;
  final int? walkFrequencyPerDay;
  final int? bathroomTimes;
  final List<dynamic>? bathroomHours;
  final String? bathroomType;
  final List<dynamic>? mealHours;
  final String? diet;
  final String? disabilities;
  final String? healthStatus;
  final String? prevSurgeries;
  final String vetsPhone;
  final String vetsName;
  final String? breed;
  final double weight;
  final String gender;
  final DateTime birthDate;
  final String typeAnimal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? idOwner;

  Pet({
    this.id,
    required this.name,
    this.vaccinationationCard,
    this.observations,
    this.walkFrequencyPerDay,
    this.bathroomHours,
    this.bathroomTimes,
    this.bathroomType,
    this.mealHours,
    this.diet,
    this.disabilities,
    this.healthStatus,
    this.prevSurgeries,
    required this.vetsPhone,
    required this.vetsName,
    this.breed,
    required this.weight,
    required this.gender,
    required this.birthDate,
    required this.typeAnimal,
    this.createdAt,
    this.updatedAt,
    this.idOwner,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['created_at'] != null ? DateTime.parse(json['updated_at']) : null,
      id: json['_id'],
      name: json['name'],
      vaccinationationCard: json['vaccination_card'],
      observations: json['additional_observations'],
      walkFrequencyPerDay: json['walk_frequency_per_day'],
      bathroomHours: json['bathroom_hours'],
      bathroomTimes: json['bathroom_times'],
      bathroomType: json['bathroom_type'],
      mealHours: json['meal_hours'],
      diet: json['diet'],
      disabilities: json['disabilities'],
      healthStatus: json['health_status'],
      prevSurgeries: json['prev_surgeries'],
      vetsName: json['vets_name'],
      vetsPhone: json['vets_phone'],
      breed: json['breed'],
      weight: json['weight'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birth_date']),
      typeAnimal: json['type_animal'],
      idOwner: json['id_owner'],
    );
  }
}
