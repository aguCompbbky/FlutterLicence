import 'package:flutter/material.dart';

class AppBodyText extends StatelessWidget {
  final String text;
  final TextAlign? align;

  const AppBodyText(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}