import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:chateo/features/auth/view/pages/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButtonWidget extends ConsumerWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;

    final typography = AppTheme.of(context).typography;
    return InkWell(
      child: Text(constants.txtForgotPassword,
          style: typography.code.copyWith(color: colors.primary)),
      onTap: () {
        context.push(ForgotPasswordPage.routePath);
      },
    );
  }
}
