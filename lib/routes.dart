import 'package:courier/ui/auth/forgot_password_screen.dart';
import 'package:courier/ui/auth/login_screen.dart';
import 'package:courier/ui/auth/otp_screen.dart';
import 'package:courier/ui/auth/register_screen.dart';
import 'package:courier/ui/auth/reset_password_screen.dart';
import 'package:courier/ui/home/home_screen.dart';
import 'package:courier/ui/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          name: 'forgot_password',
          path: 'forgot_password',
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          name: 'otp',
          path: 'otp/:channel',
          builder: (context, state) => const OTPScreen(),
        ),
      ],
    ),
    GoRoute(
      name: 'reset_password',
      path: '/reset_password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  initialLocation: '/onboarding',
);
