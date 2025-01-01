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
      color: colors.textInverse,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none, hintText: label, prefixIcon: icon),
      ),
    );
  }
}
