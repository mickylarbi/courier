import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required PageController pageController})
      : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    bool hasViewedAll = false;
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        int page =
            _pageController.page == null ? 0 : _pageController.page!.round();

        if (page == 4) hasViewedAll = true;

        return hasViewedAll
            ? ElevatedButton(
                onPressed: () {
                  context.goNamed('login');
                },
                child: const Text('GET STARTED'),
              )
            : FilledButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutQuint,
                  );
                },
                // style: FilledButton.styleFrom(
                //   backgroundColor: hasViewedAll ? null : Colors.grey[850],
                // ),
                child: const Text('NEXT'),
              );
      },
    );
  }
}
