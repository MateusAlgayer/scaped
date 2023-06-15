import 'package:flutter/material.dart';

import '../components/logo.dart';
import '../login/login_page.dart';

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
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1, milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
          ),
        ),
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
