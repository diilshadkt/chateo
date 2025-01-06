import 'package:chateo/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const TextfieldWidget({
    super.key,
    this.label,
    this.icon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorHeight: 16,
      cursorColor: colors.primary,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          hintText: label,
          contentPadding: const EdgeInsets.only(left: 8),
          hintStyle: typography.h200.copyWith(color: colors.textDisabled),
          prefixIcon: icon,
          filled: true,
          fillColor: colors.textInverse),
    );
  }
}
