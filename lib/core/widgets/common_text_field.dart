import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.title,
    this.color,
    this.validator,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final String title;
  final Color? color;
  final int maxLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final styles = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: styles.bodyLarge),
        const Gap(8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onTap: onTap,
          readOnly: readOnly,
          enableInteractiveSelection: !readOnly,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(borderSide: BorderSide(color: color ?? Colors.black)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color ?? Colors.black)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color ?? Colors.black, width: 2)),
            filled: true,
            fillColor: color?.withValues(alpha: 0.1),
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
