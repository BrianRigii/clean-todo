import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final Login login;
  final LoginParams loginParams;
  AuthController({required this.login, required this.loginParams})
      : super(AuthState.idle);

  Future<void> onlogin() async {
    state = AuthState.isLoggingIn;
    final userOrFailure = await login(loginParams);
    userOrFailure.fold(
      (failure) => state = AuthState.loggedOut,
      (user) => state = AuthState.loggedIn,
    );
  }
}

final authControllerProvider = Provider.autoDispose
    .family<AuthController, LoginParams>((ref, params) => AuthController(
          login: ref.watch(loginProvider),
          loginParams: params,
        ));

enum AuthState {
  idle,
  isLoggingIn,
  loggedIn,
  loggedOut,
}
