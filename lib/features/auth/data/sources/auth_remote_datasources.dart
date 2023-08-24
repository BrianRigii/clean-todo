import 'package:clean_todo/core/supabase/supabase_client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

abstract class AuthRemoteDataSource {
  Future<User> login(Map<String, dynamic> params);
  Future<User> signUp(Map<String, dynamic> params);
  Stream<AuthState> onAuthStateChange();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<User> login(Map<String, dynamic> params) async {
    try {
      final response = await supabaseClient.auth
          .signUp(email: params['email'], password: params['password']);
      return response.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signUp(Map<String, dynamic> params) async {
    try {
      final response = await supabaseClient.auth
          .signUp(email: params['email'], password: params['password']);
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
