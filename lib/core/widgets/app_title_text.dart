
import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow overflow;
  final Color color;

  const AppTitleText(this.text, {super.key, this.align, this.maxLines, this.overflow = TextOverflow.visible, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
    );
  }
}




