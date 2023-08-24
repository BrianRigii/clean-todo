import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password);
  Stream<AuthState> onAuthStateChange();
}
