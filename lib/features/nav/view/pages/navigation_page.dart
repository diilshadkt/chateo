import 'package:chateo/features/home/view/pages/chat.dart';
import 'package:chateo/features/home/view/pages/contacts.dart';
import 'package:chateo/features/home/view/pages/more.dart';
import 'package:chateo/features/nav/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationPage extends HookConsumerWidget {
  static const routePath = "/nav";
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final PageController = usePageController();
    return Scaffold(
      body: PageView(
        controller: PageController,
        onPageChanged: (Page) => ref
            .read(navigationControllerProvider.notifier)
            .changeSelectedPage(Page, PageController),
        children: const [contacts(), Chat(), More()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (page) => ref
              .read(navigationControllerProvider.notifier)
              .changeSelectedPage(page, PageController),
          currentIndex: ref.watch(navigationControllerProvider),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "."),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "."),
            BottomNavigationBarItem(icon: Icon(Icons.more), label: "."),
          ]),
    );
  }
}
