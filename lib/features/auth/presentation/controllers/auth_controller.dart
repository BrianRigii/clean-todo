import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final Login login;

  AuthController({required this.login}) : super(AuthState.idle);

  Future<void> onlogin(LoginParams params) async {
    state = AuthState.isLoggingIn;
    final userOrFailure = await login(params);
    userOrFailure.fold(
      (failure) => state = AuthState.loggedOut,
      (user) => state = AuthState.loggedIn,
    );
  }
}

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>(
        (ref) => AuthController(
              login: ref.watch(loginProvider),
            ));

enum AuthState {
  idle,
  isLoggingIn,
  loggedIn,
  loggedOut,
}
