import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:chateo/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class More extends ConsumerWidget {
  static const routePath = "/more";
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;
    void onLogoutButtonClicked() {
      ref.read(authControllerProvider.notifier).logout();
    }

    return Scaffold(
      backgroundColor: colors.secondary,
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          IconButton(
              onPressed: onLogoutButtonClicked, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
