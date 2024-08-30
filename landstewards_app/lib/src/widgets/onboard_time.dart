import 'package:flutter/material.dart';
import 'package:landstewards_app/src/time_controller.dart';
import 'package:landstewards_app/src/widgets/option_selector.dart';

class OnboardTime extends StatefulWidget {
  final PageController pageController;
  final TimeFilterController controller;
  const OnboardTime({required this.pageController, required this.controller, super.key});

  @override
  State<OnboardTime> createState() => _OnboardTimeState();
}

class _OnboardTimeState extends State<OnboardTime> {
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
            'How much time do you have to work on your land?',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 28.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'We’ll choose plants based on how much time you have to commit to working on the land.',
            style: TextStyle(color: Color(0xFF45423F), fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          OptionSelector<TimeFilterTypes>(
            options: TimeFilterTypes.values,
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
