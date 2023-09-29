import 'package:clean_todo/core/either/either.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/auth/domain/enitities.dart';

abstract class AuthRepository {
  LoginEither login(Map<String, dynamic> params);
  SignUpEither signUp(Map<String, dynamic> params);
}

typedef LoginEither = Future<Either<Failure, User>>;
typedef SignUpEither = Future<Either<Failure, User>>;
