import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:landstewards_app/src/plant_args.dart';

import 'package:landstewards_app/src/plant_model.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({super.key});

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  late Future<Map<String, Plant>> futurePlants;

  @override
  void initState() {
    super.initState();
    futurePlants = loadPlants();
  }

  Future<Map<String, Plant>> loadPlants() async {
    final String response = await rootBundle.loadString('assets/plants.json');
    final data = await json.decode(response);
    final plantsMap = data['plants'] as Map<String, dynamic>;
    return plantsMap.map((key, value) => MapEntry(key, Plant.fromJson(value)));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PlantArguments;
    final plantId = args.id;

    return Scaffold(
      body: FutureBuilder<Map<String, Plant>>(
        future: futurePlants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final plants = snapshot.data!;
            final plant = plants[plantId];
            if (plant == null) {
              return const Center(child: Text('Plant not found'));
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back),
                          Text(plant.name),
                        ],
                      )),
                  Image.asset(plant.image),
                  Text(plant.description),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text('Sunlight'),
                          Text(plant.sunlight),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Water'),
                          Text(plant.water),
                        ],
                      ),
                    ],
                  ),
                  const Text('Soil'),
                  Text(plant.soil),
                  const Text('Planting Schedule'),
                  Text(plant.plantingSchedule),
                  const Text('Growth Timeline'),
                  Text(plant.growthTimeline),
                  const Text('Companion Plants'),
                  Text(plant.companionPlants),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
