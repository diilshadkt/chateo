import 'package:chateo/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final String? hintText;
  const TextfieldWidget({
    super.key,
    this.label,
    this.icon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return Container(
      height: MediaQuery.sizeOf(context).height / 20,
      decoration: BoxDecoration(
          color: colors.textInverse, borderRadius: BorderRadius.circular(3)),
      child: TextField(
        cursorHeight: 16,
        cursorColor: colors.primary,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            contentPadding: const EdgeInsets.only(left: 6),
            hintStyle: typography.h200,
            prefixIcon: icon),
      ),
    );
  }
}
