import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/src/config/themes/theme_decoration.dart';

import '../../../config/router/app_router.dart';
import '../../cubits/login_cubit.dart';
import '../../cubits/login_state.dart';
import '../../widgets/logo.dart';
import 'login_form.dart';
import 'waiting_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: ThemeDecoration.boxBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Logo(),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: BlocConsumer<LoginCubit, LoginState>(
                  bloc: Modular.get<LoginCubit>(),
                  listener: (context, state) {
                    if (state is AuthenticatedLoginState) {
                      Modular.to.navigate(appRouter.homeRoute);
                    }
                  },
                  builder: (context, state) {
                    if (state is WaitingLoginState) {
                      return const WaitingForm();
                    } else {
                      return LoginForm();
                    }
                  },
                ),
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
