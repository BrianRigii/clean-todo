import 'package:clean_todo/core/contracts/usecase.dart';
import 'package:clean_todo/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

class Login extends UseCase<LoginEither, LoginParams> {
  final AuthRepository authRepository;

  Login({required this.authRepository});

  @override
  LoginEither call(LoginParams params) async {
    return authRepository.login(params.toParams);
  }
}

final loginProvider = Provider.autoDispose<Login>((ref) => Login(
      authRepository: ref.watch(authRepositoryProvider),
    ));

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> get toParams => Map.unmodifiable({
        'email': email,
        'password': password,
      });
}
