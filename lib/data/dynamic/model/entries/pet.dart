class Bathroom {
  final int times;
  final List<String> hours;
  final String type;
  Bathroom({required this.times, required this.hours, required this.type});
}

class Pet {
  final String id;
  final String name;
  final String vaccinationationCard;
  final String observations;
  final int? walkFrequencyPerDay;
  final Bathroom? bathroom;
  final List<String>? mealHours;
  final String? diet;
  final String? disabilities;
  final String? healthStatus;
  final String? prevSurgeries;
  final String vetsPhone;
  final String vetsName;
  final String breed;
  final double weight;
  final String gender;
  final DateTime birthDate;
  final String typeAnimal;

  Pet({
    required this.id,
    required this.name,
    required this.vaccinationationCard,
    required this.observations,
    this.walkFrequencyPerDay,
    this.bathroom,
    this.mealHours,
    this.diet,
    this.disabilities,
    this.healthStatus,
    this.prevSurgeries,
    required this.vetsPhone,
    required this.vetsName,
    required this.breed,
    required this.weight,
    required this.gender,
    required this.birthDate,
    required this.typeAnimal,
  });
  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      observations: json['observations'],
      vaccinationationCard: json['vaccination_card'],
      walkFrequencyPerDay: json['walk_frequency'],
      weight: json['weight'],
      bathroom: Bathroom(
        hours: json['bathroom_hours'],
        times: json['bathroom_times'],
        type: json['bathroom'],
      ),
      birthDate: DateTime(json['birth_date']),
      breed: json['breed'],
      diet: json['diet'],
      disabilities: json['disabilities'],
      gender: json['gender'],
      healthStatus: json['health_status'],
      mealHours: json['meal_hours'],
      prevSurgeries: json['prev_surgeries'],
      typeAnimal: json['type_animal'],
      vetsName: json['vets_name'],
      vetsPhone: json['vets_phone'],
    );
  }
}
