import 'package:flutter/material.dart';

class AppSubtitleText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final Color? color;

  const AppSubtitleText(this.text, {super.key, this.align, this.color});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Text(
      text,
      textAlign: align,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color ?? scheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}