import 'package:buddy_sitter/data/static/mock/sitters.dart';

class ServiceData {
  SitterData sitter;
  String pet;
  String service;
  Map<String, DateTime> range;

  ServiceData({
    required this.sitter,
    required this.pet,
    required this.service,
    required this.range,
  });

  static List<ServiceData> listFromMap(Map map) {
    List<ServiceData> services = [];
    map.forEach(
      (key, value) => services.add(ServiceData(
        sitter: value["sitter"],
        pet: value["pet"],
        service: value["service"],
        range: value["range"],
      )),
    );
    return services;
  }
}
