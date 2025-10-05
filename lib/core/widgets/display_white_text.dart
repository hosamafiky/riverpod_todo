import 'package:flutter/material.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText(this.text, {super.key, this.fontSize, this.fontWeight = FontWeight.bold});

  final String text;
  final double? fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(color: context.colorScheme.surface, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
