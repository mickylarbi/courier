import 'package:flutter/material.dart';

class AppleOAuthButton extends StatelessWidget {
  const AppleOAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      icon: Image.asset(
        'assets/images/logos/logos_apple.png',
        height: 20,
        fit: BoxFit.fitHeight,
        color: Colors.white70,
      ),
      label: const Text('Continue with Apple'),
    );
  }
}


class GoogleOAuthButton extends StatelessWidget {
  const GoogleOAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      icon: Image.asset(
        'assets/images/logos/logos_google-icon.png',
        height: 20,
        fit: BoxFit.fitHeight,
      ),
      label: const Text('Continue with Google'),
    );
  }
}
