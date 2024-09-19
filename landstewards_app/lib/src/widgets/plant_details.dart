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
      backgroundColor: const Color(0xFFF2F0DB),
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.arrow_back, size: 28.0, color: Color(0xFF45423F)),
                          ),
                          Text("Back",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Color(0xFF45423F))),
                        ],
                      )),
                  const Center(child: Text('Plant not found')),
                ],
              );
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
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.arrow_back, size: 28.0, color: Color(0xFF45423F)),
                          ),
                          Text(plant.name,
                              style: const TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w700, color: Color(0xFF45423F))),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Image.asset(plant.image),
                  ),
                  Text(plant.description,
                      style: const TextStyle(fontSize: 14.0, height: 1.5, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sunlight',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                          ),
                          Text(plant.sunlight),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Water',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                          ),
                          Text(plant.water),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Text(
                    'Soil',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  ),
                  Text(plant.soil),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Text(
                    'Planting Schedule',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  ),
                  Text(plant.plantingSchedule),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Text(
                    'Growth Timeline',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  ),
                  Text(plant.growthTimeline),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Text(
                    'Companion Plants',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  ),
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
