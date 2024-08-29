import 'package:flutter/material.dart';
import 'package:landstewards_app/src/onboard.dart';

class LandStewards extends StatelessWidget {
  const LandStewards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Land Stewards',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: const Onboard(),
      ),
    );
  }
}
