abstract interface class IAuth {
  void signIn({required String email});
  bool isAuthenticaded();
}
