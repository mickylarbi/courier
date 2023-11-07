import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 40,
      child: Image.asset(
        'assets/images/splash.png',
        height: 40,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
