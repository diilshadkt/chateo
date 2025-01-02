import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  const ButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: spacer.space_600,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: onPressed,
        child: Text(
          constants.txtContinueBtn,
          style: typography.h500.copyWith(color: colors.secondary),
        ),
      ),
    );
  }
}
