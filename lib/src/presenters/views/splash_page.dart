import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../config/router/app_router.dart';
import '../../domain/repositories/i_auth.dart';
import '../widgets/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      Modular.isModuleReady().whenComplete(
        () => Future.delayed(const Duration(milliseconds: 500), () {
          if (Modular.get<IAuth>().isAuthenticaded()) {
            Modular.to.navigate(appRouter.homeRoute);
          } else {
            Modular.to.navigate(appRouter.loginRoute);
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('lib/assets/background.png'), fit: BoxFit.fill),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Logo(),
            SizedBox(height: 40),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}