import 'package:clean_todo/core/supabase/supabase_client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password);
  Stream<AuthState> onAuthStateChange();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<User> login(String email, String password) async {
    try {
      final response =
          await supabaseClient.auth.signUp(email: email, password: password);
      return response.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      final response =
          await supabaseClient.auth.signUp(email: email, password: password);
      return response.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<AuthState> onAuthStateChange() async* {
    supabaseClient.auth.onAuthStateChange.listen((event) {
      event;
    });
  }
}

final authRemoteDataSourceProvider = Provider.autoDispose<AuthRemoteDataSource>(
    (ref) => AuthRemoteDataSourceImpl(
        supabaseClient: ref.watch(superbaseClientProvider)));
