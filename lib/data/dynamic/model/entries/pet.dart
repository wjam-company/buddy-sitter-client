class Bathroom {
  final DateTime times;
  final DateTime hours;
  final String type;
  Bathroom({required this.times, required this.hours, required this.type});
}

class Pet {
  final String id;
  final String name;
  final String vacationationCard;
  final String observations;
  final int walkFrequency;
  final Bathroom bathroom;
  final String mealHours;
  final String diet;
  final String disabilities;
  final String healthStatus;
  final String prevSurgeries;
  final String vestPhone;
  final String vestName;
  final String breed;
  final int weight;
  final String gender;
  final DateTime birthDate;
  final String typeAnimal;

  Pet({
    required this.id,
    required this.name,
    required this.vacationationCard,
    required this.observations,
    required this.walkFrequency,
    required this.bathroom,
    required this.mealHours,
    required this.diet,
    required this.disabilities,
    required this.healthStatus,
    required this.prevSurgeries,
    required this.vestPhone,
    required this.vestName,
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
      vacationationCard: json['vaccination_card'],
      walkFrequency: json['walk_frequency'],
      weight: json['weight'],
      bathroom: Bathroom(
        hours: DateTime(json['bathroom_hours']),
        times: DateTime(json['bathroom_times']),
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
      vestName: json['vets_name'],
      vestPhone: json['vets_phone'],
    );
  }
}
