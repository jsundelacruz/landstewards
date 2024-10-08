import 'package:flutter/material.dart';
import 'package:landstewards_app/src/experience_controller.dart';
import 'package:landstewards_app/src/goal_controller.dart';
import 'package:landstewards_app/src/plants_controller.dart';
import 'package:landstewards_app/src/time_controller.dart';
import 'package:landstewards_app/src/widgets/onboard_experience.dart';
import 'package:landstewards_app/src/widgets/onboard_goal.dart';
import 'package:landstewards_app/src/widgets/onboard_plants.dart';
import 'package:landstewards_app/src/widgets/onboard_splash.dart';
import 'package:landstewards_app/src/widgets/onboard_time.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  late List<Widget> pages;
  int _currentPage = 0;

  final GoalFilterController _goalController = GoalFilterController();
  final ExpFilterController _expController = ExpFilterController();
  final TimeFilterController _timeController = TimeFilterController();
  final PlantsFilterController _plantsController = PlantsFilterController();

  @override
  void initState() {
    super.initState();

    pages = [
      OnboardSplash(pageController: _pageController),
      OnboardGoal(pageController: _pageController, controller: _goalController),
      OnboardExperience(pageController: _pageController, controller: _expController),
      OnboardTime(pageController: _pageController, controller: _timeController),
      OnboardPlants(pageController: _pageController, controller: _plantsController)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          key: const ValueKey('onboard'),
          children: [
            PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: pages[index]);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
