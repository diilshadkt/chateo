import 'package:chateo/features/auth/services/auth_service.dart';
import 'package:chateo/features/auth/view/pages/forgot_password_page.dart';
import 'package:chateo/features/auth/view/pages/landing_page.dart';
import 'package:chateo/features/auth/view/pages/login_page.dart';
import 'package:chateo/features/auth/view/pages/signup_page.dart';
import 'package:chateo/features/home/more.dart';
import 'package:chateo/features/nav/view/pages/navigation_page.dart';
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
        redirect: (context, state) {
          final user = AuthService.getCurrentUserSync();
          if (user != null) {
            return NavigationPage.routePath;
          }
          return null;
        },
      ),
      GoRoute(
        path: ForgotPasswordPage.routePath,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: NavigationPage.routePath,
        builder: (context, state) => const NavigationPage(),
      ),
      GoRoute(
        path: More.routePath,
        builder: (context, state) => const More(),
      ),
    ]);
