import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final StreamSubscription<AuthState> _supabaseAuthListener;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      Modular.getAsync<Supabase>().then((i) {
        _supabaseAuthListener = i.client.auth.onAuthStateChange.listen((event) {
          if (event.session != null && mounted) {
            Modular.to.navigate('/home');
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _supabaseAuthListener.cancel();
    _emailController.dispose();
    super.dispose();
  }

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
          const SizedBox(height: 80),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: (value) => (value?.isEmpty ?? false) ? 'Não deve ser vazio' : null,
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
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            Supabase sup = await Modular.getAsync<Supabase>();
                            await sup.client.auth.signInWithOtp(
                              email: _emailController.text,
                              emailRedirectTo: 'com.ifsul.scaped://login-callback',
                            );
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
