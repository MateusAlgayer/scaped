import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => appRouter.routes;

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<AppTheme>((i) => AppTheme.instance),
        AsyncBind<Supabase>(
          (i) => Supabase.initialize(
            url: dotenv.env['SUPABASE_URL']!,
            anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
          ),
        ),
      ];
}
