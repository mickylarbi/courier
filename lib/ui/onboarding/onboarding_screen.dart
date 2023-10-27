import 'package:courier/ui/onboarding/button.dart';
import 'package:courier/ui/onboarding/carousel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1F),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            SmoothPageIndicator(
              controller: _pageController,
              count: 5,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                expansionFactor: 2,
                dotHeight: 4,
                dotWidth: 12,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: OnboardingCarousel(pageController: _pageController)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OnboardingButton(
                pageController: _pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}
