import 'package:clean_todo/core/contracts/usecase.dart';
import 'package:clean_todo/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

class SignUp extends UseCase<SignUpEither, SignUpParams> {
  final AuthRepository authRepository;

  SignUp({required this.authRepository});
  @override
  SignUpEither call(SignUpParams params) {
    return authRepository.signUp(params.toParams);
  }
}

class SignUpParams {
  final String username;
  final String email;
  final String password;

  SignUpParams(
      {required this.username, required this.email, required this.password});

  Map<String, dynamic> get toParams => Map.unmodifiable(
      ({'name': username, 'email': email, 'password': password}));
}

final signUpProvider = Provider.autoDispose<SignUp>(
    (ref) => SignUp(authRepository: ref.watch(authRepositoryProvider)));
