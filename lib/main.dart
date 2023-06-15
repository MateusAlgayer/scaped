import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'views/splash/splash_page.dart';
import 'views/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}

class MainModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [];

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [];
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      theme: AppTheme.scapedThemeDataLight,
      darkTheme: AppTheme.scapedThemeDataDark,
      themeMode: ThemeMode.system,
    );
  }
}
