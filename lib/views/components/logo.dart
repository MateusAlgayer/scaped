import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image.asset(Theme.of(context).brightness == Brightness.dark ? 'lib/assets/logo_mono.png' : 'lib/assets/logo.png'),
    );
  }
}
