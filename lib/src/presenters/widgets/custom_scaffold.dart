import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/src/domain/repositories/i_auth.dart';

import '../../config/router/app_router.dart';
import '../../config/themes/app_theme.dart';
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
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {},
                    label: const Text('Publicar'),
                    icon: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: const Text('Minhas publicações'),
                    icon: const Icon(Icons.article),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Modular.get<AppTheme>().setTheme(
                        Modular.get<AppTheme>().themeNotifier.value == ApplicationTheme.light
                            ? ApplicationTheme.dark
                            : ApplicationTheme.light,
                      );
                      setState(() {});
                    },
                    icon: Icon(
                        Modular.get<AppTheme>().themeNotifier.value == ApplicationTheme.light ? Icons.brightness_high : Icons.brightness_2),
                    label: const Text('Alterar tema'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    label: const Text('Sair'),
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      Modular.get<IAuth>().signOut();
                      Modular.to.navigate(appRouter.loginRoute);
                    },
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
