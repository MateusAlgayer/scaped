sealed class LoginState {
  final String email;
  const LoginState({this.email = ''});
}

class MagicLinkSendState extends LoginState {
  const MagicLinkSendState({super.email});
}

class WaitingState extends LoginState {
  const WaitingState();
}
