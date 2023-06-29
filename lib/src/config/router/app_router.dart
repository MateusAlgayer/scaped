import 'package:flutter_modular/flutter_modular.dart';

import '../../presenters/views/home/home_page.dart';
import '../../presenters/views/login/login_page.dart';
import '../../presenters/views/splash/splash_page.dart';

final appRouter = AppRouter._();

class AppRouter {
  AppRouter._();

  final String loginRoute = '/login';
  final String homeRoute = '/home';

  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ChildRoute(
          loginRoute,
          child: (context, args) => const LoginPage(),
          duration: const Duration(seconds: 2),
          transition: TransitionType.scale,
        ),
        ChildRoute(
          homeRoute,
          child: (context, args) => const HomePage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
