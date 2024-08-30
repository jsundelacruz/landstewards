import 'package:flutter/material.dart';
import 'package:landstewards_app/src/experience_controller.dart';
import 'package:landstewards_app/src/widgets/option_selector.dart';

class OnboardExperience extends StatefulWidget {
  final PageController pageController;
  final ExpFilterController controller;
  const OnboardExperience({required this.pageController, required this.controller, super.key});

  @override
  State<OnboardExperience> createState() => _OnboardExperienceState();
}

class _OnboardExperienceState extends State<OnboardExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: const Color(0xFFF2F0DB),
      // constraints: BoxConstraints(maxWidth: 800, maxHeight: MediaQuery.of(context).size.height - 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const Text(
            'How much experience do you have with building, farming, permaculture?',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 28.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'We can tailor your recommendations based on your experience level.',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          OptionSelector<ExpFilterTypes>(
            options: ExpFilterTypes.values,
            getDescription: widget.controller.getEnumDescription,
            selectedOptions: widget.controller.selectedFilters,
            onSelected: (option, selected) {
              setState(() {
                if (selected) {
                  widget.controller.selectedFilters.clear();
                  widget.controller.selectedFilters.add(option);
                } else {
                  widget.controller.selectedFilters.remove(option);
                }
              });
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF45423F),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
                ),
                onPressed: widget.controller.selectedFilters.isNotEmpty
                    ? () {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                child: const Text('NEXT',
                    style: TextStyle(color: Color(0xFFF2F0DB), fontSize: 16.0, fontWeight: FontWeight.w700))),
          ),
        ],
      ),
    );
  }
}
