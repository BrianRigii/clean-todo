import 'package:clean_todo/core/either/either.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/auth/data/sources/auth_remote_datasources.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  LoginEither login(Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.login(params);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<AuthState> onAuthStateChange() {
    return _remoteDataSource.onAuthStateChange();
  }

  @override
  SignUpEither signUp(Map<String, dynamic> params) {
    throw UnimplementedError();
  }

  @override
  Future signInWithOtp(String params) {
    return _remoteDataSource.signInWithOtp(params);
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        remoteDataSource: ref.watch(authRemoteDataSourceProvider)));
