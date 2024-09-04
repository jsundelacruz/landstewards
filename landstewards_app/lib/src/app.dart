import 'package:flutter/material.dart';
import 'package:landstewards_app/src/onboard.dart';
import 'package:landstewards_app/src/widgets/garden_location.dart';
import 'package:landstewards_app/src/widgets/recommendations.dart';

class LandStewards extends StatelessWidget {
  const LandStewards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Land Stewards',
      initialRoute: '/',
      routes: {
        '/': (context) => const Scaffold(
              body: Onboard(),
            ),
        '/onboard': (context) => const Onboard(),
        '/location': (context) => const GardenLocation(),
        '/recommendations': (context) => const Recommendations(),
      },
    );
  }
}
