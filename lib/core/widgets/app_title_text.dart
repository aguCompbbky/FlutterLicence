
import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow overflow;

  const AppTitleText(this.text, {super.key, this.align, this.maxLines, this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
    );
  }
}




