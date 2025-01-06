import 'package:chateo/core/themes/app_theme.dart';
import 'package:chateo/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final UserModel user;
  const UserListWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(user.name[0].toUpperCase()),
        ),
      ),
      title: Text(
        user.name,
        style: typography.h300,
      ),
      subtitle: const Text("Last message"),
      trailing: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 10,
            child: Text("2",
                style: typography.code.copyWith(color: colors.secondary)),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text("12:00 am")
        ],
      ),
    );
  }
}
