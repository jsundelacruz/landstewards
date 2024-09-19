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
          const Spacer(),
          const Text(
            'Land Stewards',
            style:
                TextStyle(color: Color(0xFFF2F0DB), fontSize: 43.0, fontFamily: 'LTC Law', fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: 215.0,
            child: Text(
              'learning to live with the land'.toUpperCase(),
              style: const TextStyle(
                  color: Color(0xFFF2F0DB), fontSize: 23.0, fontFamily: 'AvantGarde LT', fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF5D7B1E),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                ),
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('let’s get planting'.toUpperCase(),
                    style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.0,
                        fontFamily: 'AvantGarde LT',
                        fontWeight: FontWeight.w700))),
          ),
        ],
      ),
    );
  }
}
