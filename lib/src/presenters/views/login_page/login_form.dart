import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/src/presenters/cubits/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
            //FIXME: Colocar uma validação de e-mail decente.
            validator: (value) => (value?.isEmpty ?? false) ? 'Não deve ser vazio' : null,
          ),
          const SizedBox(height: 4),
          FilledButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              context.read<LoginCubit>().signIn(email: _emailController.text);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login),
                Text('Entrar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
