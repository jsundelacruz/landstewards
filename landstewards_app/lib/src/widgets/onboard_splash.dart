import 'package:flutter/material.dart';

class OnboardSplash extends StatelessWidget {
  final PageController pageController;
  const OnboardSplash({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      // constraints: BoxConstraints(maxWidth: 800, maxHeight: MediaQuery.of(context).size.height - 70),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Land Stewards',
            style: TextStyle(color: Color(0xFFF2F0DB), fontSize: 43.0),
          ),
          const Text(
            'learning to live with the land',
            style: TextStyle(color: Color(0xFFF2F0DB), fontSize: 23.0),
          ),
          FilledButton(
              onPressed: () {
                pageController.nextPage(
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
