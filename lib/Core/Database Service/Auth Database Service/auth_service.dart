import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) async {
    return await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
      String email, String password, String phone) async {
    return await supabase.auth.signUp(
      password: password,
      email: email,
      phone: phone,
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<void> forgotPassword(String email) async {
    return await supabase.auth.resetPasswordForEmail(email);
  }

  String? getCurrentUser() {
    return supabase.auth.currentUser?.email;
  }
}
