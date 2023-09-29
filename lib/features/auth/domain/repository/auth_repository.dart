import 'package:clean_todo/core/either/either.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  LoginEither login(Map<String, dynamic> params);
  SignUpEither signUp(Map<String, dynamic> params);
  Future signInWithOtp(String params);
  Stream<AuthState> onAuthStateChange();
}

typedef LoginEither = Future<Either<Failure, User>>;
typedef SignUpEither = Future<Either<Failure, User>>;
