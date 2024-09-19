import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GardenLocation extends StatelessWidget {
  const GardenLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: MapController(),
        options: const MapOptions(initialCenter: const LatLng(37.7749, -122.4194), initialZoom: 12),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.landstewards',
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28),
              child: SizedBox(
                width: double.infinity,
                // height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF45423F),
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/recommendations');
                    },
                    child: Text('confirm area'.toUpperCase(),
                        style: const TextStyle(
                            color: Color(0xFFF2F0DB),
                            fontFamily: 'AvantGarde LT',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
