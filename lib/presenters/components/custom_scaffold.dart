import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../themes/app_theme.dart';
import 'logo.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  const CustomScaffold({
    required this.body,
    super.key,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.05,
          child: const Logo(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Publicar'),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.article),
                      Text('Minhas publicações'),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Modular.get<AppTheme>().setTheme(
                      Modular.get<AppTheme>().themeNotifier.value == ApplicationTheme.light
                          ? ApplicationTheme.dark
                          : ApplicationTheme.light,
                    );
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Modular.get<AppTheme>().themeNotifier.value == ApplicationTheme.light
                          ? Icons.brightness_high
                          : Icons.brightness_2),
                      const Text('Alterar tema'),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      Text('Sair'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: widget.body,
    );
  }
}
