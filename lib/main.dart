import 'package:chateo/features/auth/view/pages/landing_page.dart';
import 'package:chateo/features/auth/view/pages/signup_page.dart';
import 'package:chateo/features/nav/view/pages/navigation_page.dart';
import 'package:chateo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignupPage(),
    );
  }
}
