import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/views/splash/splash_page.dart';

import 'views/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}

class MainModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (context, args) => const SplashPage()),
      ];

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        Bind.singleton<AppTheme>((i) => AppTheme()),
      ];
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late AppTheme appTheme;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      appTheme = Modular.get<AppTheme>();
    }
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash');
    return ValueListenableBuilder<ApplicationTheme>(
      valueListenable: appTheme.themeNotifier,
      builder: (context, value, child) => MaterialApp.router(
        theme: appTheme.theme,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
