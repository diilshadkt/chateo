import 'package:chateo/auth/view/pages/landing_page.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(routes: [
  GoRoute(path: LandingPage.routePath,
  builder: (context, state) => const LandingPage(),
  
  )
]);
