import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? label;
  final Widget? icon;
  const TextfieldWidget({super.key, this.label, this.icon,});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          prefixIcon: icon),
    );
  }
}
