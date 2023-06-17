import 'package:flutter/material.dart';

import '../components/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('lib/assets/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          const Logo(),
          //TODO: Passar essa função para o menu lateral, ela troca a cor da aplicação.
          // FilledButton(
          //   onPressed: () {
          //     Modular.get<AppTheme>().setTheme(
          //       Modular.get<AppTheme>().themeNotifier.value == ApplicationTheme.light ? ApplicationTheme.dark : ApplicationTheme.light,
          //     );
          //   },
          //   child: const Text('Toggle'),
          // ),
          const SizedBox(height: 80),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Usuário',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO: Implementar
                      },
                      child: const Text('Esqueci minha senha'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Permanecer conectado'),
                        Switch(
                          value: true,
                          onChanged: (bool ligado) {
                            //TODO: Fazer
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            //TODO: Implementar
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.how_to_reg),
                              Text('Registrar'),
                            ],
                          ),
                        ),
                        FilledButton(
                          onPressed: () {
                            //TODO: Implementar
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.login),
                              Text('Entrar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
