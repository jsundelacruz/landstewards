import 'package:flutter/material.dart';
import 'package:landstewards_app/src/plant_args.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0DB),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recommendations For'.toUpperCase(),
                      style: const TextStyle(color: Color(0xFF45423F), fontSize: 14.0, fontWeight: FontWeight.w500)),
                  const Text('10010 Forsythe Road, Dobbins',
                      style: TextStyle(color: const Color(0xFF45423F), fontSize: 18.0, fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(splashRadius: 1.0, onPressed: () {}, icon: const Icon(Icons.bookmark)),
                      const Text('Plant Guild',
                          style:
                              TextStyle(color: const Color(0xFF45423F), fontSize: 24.0, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.cached)),
                    ],
                  ),
                  Wrap(spacing: 5.0, children: [
                    ActionChip(
                        label: const Text('Rosemary'),
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        backgroundColor: const Color(0xFF5F7161),
                        onPressed: () {
                          Navigator.pushNamed(context, '/plant-details', arguments: PlantArguments('rosemary'));
                        }),
                    ActionChip(
                        label: const Text('Yerba Buena'),
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        backgroundColor: const Color(0xFF5F7161),
                        onPressed: () {
                          Navigator.pushNamed(context, '/plant-details', arguments: PlantArguments('yerba_buena'));
                        }),
                    ActionChip(
                        label: const Text('Fig'),
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        backgroundColor: const Color(0xFF5F7161),
                        onPressed: () {
                          Navigator.pushNamed(context, '/plant-details', arguments: PlantArguments('fig'));
                        }),
                    ActionChip(
                        label: const Text('Pomegranate'),
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        backgroundColor: const Color(0xFF5F7161),
                        onPressed: () {
                          Navigator.pushNamed(context, '/plant-details', arguments: PlantArguments('pomegranate'));
                        }),
                    ActionChip(
                        label: const Text('Blueberry'),
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        backgroundColor: const Color(0xFF5F7161),
                        onPressed: () {
                          Navigator.pushNamed(context, '/plant-details', arguments: PlantArguments('blueberry'));
                        }),
                  ]),
                  const SizedBox(height: 26.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
                      const Expanded(
                        child: Text(
                          'Together, these plants form a resilient and productive guild that leverages your local climate, soil, and moisture conditions to create a thriving, low-maintenance garden. This guild supports a self-sustaining ecosystem, attracting pollinators like bees and butterflies while providing habitat and food for beneficial insects and other wildlife, contributing to a balanced and biodiverse environment.',
                          style: TextStyle(color: Color(0xFF45423F), fontSize: 16.0),
                          softWrap: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.3,
                maxChildSize: 0.8,
                builder: (BuildContext context, scrollController) {
                  return Container(
                      height: constraints.maxHeight,
                      decoration: const BoxDecoration(
                        color: Color(0xFFA3B899),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              controller: scrollController,
                              child: TabBar(
                                indicatorColor: const Color(0xFF45423F),
                                dividerColor: Colors.transparent,
                                padding: const EdgeInsets.only(top: 25.0),
                                labelStyle: const TextStyle(
                                  color: Color(0xFF45423F),
                                  fontSize: 14.0,
                                  height: 1.15,
                                  fontWeight: FontWeight.w700,
                                ),
                                tabs: <Widget>[
                                  Tab(
                                    height: 64.0,
                                    child: Text(
                                      'preparing to plant'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Tab(
                                    height: 54.0,
                                    child: Text(
                                      'caring for your plants'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Tab(
                                    height: 54.0,
                                    child: Text(
                                      'your area’s climate'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 36.0),
                                child: TabBarView(
                                  children: <Widget>[
                                    ListView(
                                      controller: scrollController,
                                      physics: const ClampingScrollPhysics(),
                                      children: [
                                        Text(
                                          'Planting Time'.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ITC Avant Garde Gothic LT'),
                                        ),
                                        const Text(
                                          'Plant in early spring or fall to allow plants to establish before extreme weather conditions.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 25.0),
                                        Text(
                                          'Soil Preparation'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'Plant in early spring or fall to allow plants to establish before extreme weather conditions.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 25.0),
                                        Text(
                                          'Planting Layout'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'Keep plants at least 18 inches apart to allow proper growth.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    ListView(
                                      controller: scrollController,
                                      physics: const ClampingScrollPhysics(),
                                      children: [
                                        Text(
                                          'Watering Schedule'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'Water deeply once a week, adjusting for rainfall.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 25.0),
                                        Text(
                                          'Fertilization'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'Apply a balanced, organic fertilizer in spring and midsummer to support growth and fruit production.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 25.0),
                                        Text(
                                          'Mulching'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'Apply a 2-inch layer of mulch around plants to retain moisture and suppress weeds.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    ListView(
                                      controller: scrollController,
                                      physics: const ClampingScrollPhysics(),
                                      children: [
                                        Text(
                                          'climate watch outs'.toUpperCase(),
                                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          'With exceptional heat and humidity and less than average rainfall this year in California, consider mulching more heavily to retain soil moisture and protect roots from extreme temperatures. Adjust planting schedules to avoid the hottest periods, and monitor plants closely for signs of heat stress, such as wilting or leaf scorch. Shade cloth or temporary covers can also be used to protect vulnerable plants during peak heat. Additionally, be mindful of pests that thrive in warmer, drier conditions and take proactive measures to manage them.',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
