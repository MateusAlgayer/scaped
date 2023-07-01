import 'package:scaped/src/data/datasource/remote/db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppAuth {
  AppAuth() {
    DB.init();
  }

  void signInMagicLink(String email) {
    Supabase.instance.client.auth.signInWithOtp(
      email: email,
      emailRedirectTo: 'com.ifsul.scaped://login-callback',
    );
  }

  bool isAuthenticated() {
    return Supabase.instance.client.auth.currentSession != null;
  }
}
