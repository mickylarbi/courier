import 'package:courier/ui/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
  initialLocation: '/onboarding'
);
