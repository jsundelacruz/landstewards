import 'package:flutter/material.dart';
import 'package:landstewards_app/src/goal_controller.dart';

enum GoalFilter { walking, running, cycling, hiking }

class OnboardGoal extends StatefulWidget {
  final PageController pageController;
  final GoalFilterController goalController;
  const OnboardGoal({required this.pageController, required this.goalController, super.key});

  @override
  State<OnboardGoal> createState() => _OnboardGoalState();
}

class _OnboardGoalState extends State<OnboardGoal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: Color(0xFFF2F0DB),
      // constraints: BoxConstraints(maxWidth: 800, maxHeight: MediaQuery.of(context).size.height - 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What do you hope to achieve? ',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 28.0),
          ),
          const Text(
            'Let’s get to know your goals in becoming a Land Steward.',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 16.0),
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 5.0,
            // runSpacing: 5.0,
            children: GoalFilterTypes.values.map((GoalFilterTypes personality) {
              return FilterChip(
                label: Text(personality.name),
                selected: widget.goalController.selectedFilters.contains(personality),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.goalController.addFilter(personality);
                    } else {
                      widget.goalController.removeFilter(personality);
                    }
                    // widget.onChanged?.call();
                  });
                },
              );
            }).toList(),
          ),
          FilledButton(
              onPressed: () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Lets Get Planting')),
        ],
      ),
    );
  }
}
