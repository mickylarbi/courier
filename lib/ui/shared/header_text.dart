import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
