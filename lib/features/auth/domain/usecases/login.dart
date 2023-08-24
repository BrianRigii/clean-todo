import 'package:clean_todo/core/contracts/usecase.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';

class Login extends UseCase<LoginEither, LoginParams> {
  final AuthRepository authRepository;

  Login({required this.authRepository});

  @override
  LoginEither call(LoginParams params) async {
    return authRepository.login(params.toParams);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> get toParams => Map.unmodifiable({
        'email': email,
        'password': password,
      });
}
