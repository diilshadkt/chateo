import 'package:chateo/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class More extends ConsumerWidget {
  static const routePath = "/more";
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogoutButtonClicked() {
      ref.read(authControllerProvider.notifier).logout();
    }

    return Scaffold(
      backgroundColor: Colors.orange,
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
