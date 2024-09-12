class Plant {
  final String name;
  final String image;
  final String description;
  final String sunlight;
  final String water;
  final String soil;
  final String plantingSchedule;
  final String growthTimeline;
  final String companionPlants;

  Plant(
      {required this.name,
      required this.image,
      required this.description,
      required this.sunlight,
      required this.water,
      required this.soil,
      required this.plantingSchedule,
      required this.growthTimeline,
      required this.companionPlants});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      sunlight: json['sunlight'],
      water: json['water'],
      soil: json['soil'],
      plantingSchedule: json['plantingSchedule'],
      growthTimeline: json['growthTimeline'],
      companionPlants: json['companionPlants'],
    );
  }
}
