import 'package:flutter/material.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final screenSize = context.screenSize;
    return Container(
      width: screenSize.width,
      height: height ?? (screenSize.height * 0.3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primaryContainer),
      child: child,
    );
  }
}
