import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;

    return Scaffold(
      backgroundColor: colors.secondary,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 7,
            ),
            Text(
              constants.txtHeading,
              style: typography.h800,
            ),
            Text(
              constants.txtSubHeading,
              style: typography.h100.copyWith(color: colors.text),
            )
          ],
        ),
      ),
    );
  }
}
