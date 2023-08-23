import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<User> login(String email, String password) async {
    try {
      final response =
          await supabaseClient.auth.signUp(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
