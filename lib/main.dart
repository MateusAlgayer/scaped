import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/views/home/home_page.dart';
import 'package:scaped/views/login/login_page.dart';
import 'package:scaped/views/splash/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  dotenv.load(fileName: '.env.dev');

  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}

class MainModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (context, args) => const SplashPage()),
        ChildRoute(
          '/login',
          child: (context, args) => const LoginPage(),
          duration: const Duration(seconds: 2),
          transition: TransitionType.scale,
        ),
        ChildRoute(
          '/home',
          child: (context, args) => const HomePage(),
          duration: const Duration(seconds: 2),
          transition: TransitionType.scale,
        )
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<AppTheme>((i) => AppTheme()),
        AsyncBind<Supabase>(
          (i) => Supabase.initialize(
            url: dotenv.env['SUPABASE_URL']!,
            anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
          ),
        ),
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
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
