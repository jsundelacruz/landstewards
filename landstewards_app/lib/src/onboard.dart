import 'package:flutter/material.dart';
import 'package:landstewards_app/src/goal_controller.dart';
import 'package:landstewards_app/src/widgets/onboard_goal.dart';
import 'package:landstewards_app/src/widgets/onboard_splash.dart';

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

  @override
  void initState() {
    super.initState();

    pages = [
      OnboardSplash(pageController: _pageController),
      OnboardGoal(pageController: _pageController, goalController: _goalController),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          key: const ValueKey('onboard_mi'),
          children: [
            PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
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
