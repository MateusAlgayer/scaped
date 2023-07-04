import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/src/presenters/cubits/login_state.dart';

import '../../domain/repositories/i_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const FormLoginState());

  void signIn({required String email}) {
    Modular.get<IAuth>()
      ..signIn(email: email)
      ..onAuthStateChange(onAuthenticated: () => emit(const AuthenticatedLoginState()));

    emit(WaitingLoginState(email: email));
  }

  void cancel() {
    Modular.get<IAuth>().cancelAuthCheck();
    emit(const FormLoginState());
  }
}
