import 'package:flutter_modular/flutter_modular.dart';

import '../../../splash_page.dart';
import '../../presenters/pages/home_page/home_page.dart';
import '../../presenters/pages/login_page/login_page.dart';

final appRouter = AppRouter._();

class AppRouter {
  AppRouter._();

  final String loginRoute = '/login';
  final String homeRoute = '/home';

  static const TransitionType appDefaultTransition = TransitionType.fadeIn;
  static const Duration appDefaultTransitionDuration = Duration(milliseconds: 800);

  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ChildRoute(
          loginRoute,
          child: (context, args) => const LoginPage(),
          duration: appDefaultTransitionDuration,
          transition: appDefaultTransition,
        ),
        ChildRoute(
          homeRoute,
          child: (context, args) => const HomePage(),
          duration: appDefaultTransitionDuration,
          transition: appDefaultTransition,
        ),
      ];
}
