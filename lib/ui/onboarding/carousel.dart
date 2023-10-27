import 'package:flutter/material.dart';

class OnboardingCarousel extends StatelessWidget {
  const OnboardingCarousel({super.key, required PageController pageController})
      : _pageController = pageController;

  final PageController _pageController;

  List<IconData> get icons => [
        Icons.delivery_dining_outlined,
        Icons.domain_outlined,
        Icons.timer_outlined,
        Icons.location_on_outlined,
        Icons.start,
      ];

  List<String> get pictures =>
      ['intro', 'door_to_door', 'time', 'tracking', 'delivery'];

  List<String> get messages => [
        'Courier services have never been easier',
        'Door to door pickup and delivery',
        'Timely delivery',
        'Track your packages',
        'Start sending your deliveries through us',
      ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: icons.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            Text(
              messages[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28),
            ),
            const Spacer(flex: 5),
            Image.asset(
              'assets/images/onboarding/${pictures[index]}.png',
              fit: BoxFit.fitWidth,
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
