import 'package:flutter_modular/flutter_modular.dart';

import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';
import 'src/data/datasource/remote/app_database.dart';
import 'src/data/datasource/remote/auth/app_auth.dart';
import 'src/data/repositories/auth_impl.dart';
import 'src/data/repositories/post_dao_impl.dart';
import 'src/domain/repositories/i_auth.dart';
import 'src/domain/repositories/i_post_dao.dart';
import 'src/presenters/cubits/home/home_cubit.dart';
import 'src/presenters/cubits/login/login_cubit.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => appRouter.routes;

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<AppTheme>((i) => AppTheme.instance),
        Bind.factory<AppDatabase>((i) => AppDatabase()),
        Bind.singleton<IPostDAO>((i) => PostDAOImpl(i())),
        Bind.factory<AppAuth>((i) => AppAuth()),
        Bind.singleton<IAuth>((i) => AuthImpl(i())),
        Bind.singleton<LoginCubit>(
          (i) => LoginCubit(),
          selector: (value) => value.stream,
          onDispose: (value) => value.close(),
        ),
        Bind.singleton<HomeCubit>(
          (i) => HomeCubit(),
          selector: (value) => value.stream,
          onDispose: (value) => value.close(),
        )
      ];
}
