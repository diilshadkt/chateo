import 'package:chateo/features/auth/view/pages/forgot_password_page.dart';
import 'package:chateo/features/auth/view/pages/landing_page.dart';
import 'package:chateo/features/auth/view/pages/login_page.dart';
import 'package:chateo/features/auth/view/pages/signup_page.dart';
import 'package:chateo/main.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  initialLocation: LoginPage.routePath,
  navigatorKey: MyApp.navigatorKey,
  routes: [
  GoRoute(
    path: LandingPage.routePath,
  builder: (context, state) => const LandingPage(),
  
  ),
   GoRoute(
    path: SignupPage.routePath,
  builder: (context, state) => const SignupPage(),
  
  ),
   GoRoute(
    path: LoginPage.routePath,
  builder: (context, state) => const LoginPage(),
  
  ),
   GoRoute(
    path: ForgotPasswordPage.routePath,
  builder: (context, state) => const ForgotPasswordPage(),
  
  )
]);
