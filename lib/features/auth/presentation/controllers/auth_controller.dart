import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/auth/domain/enitities.dart';
import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:clean_todo/features/auth/domain/usecases/signup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final Login login;
  final SignUp signUp;

  AuthController({required this.login, required this.signUp})
      : super(AuthState.idle);

  Future<void> onlogin(LoginParams params) async {
    state = AuthState.isLoggingIn;
    final userOrFailure = await login(params);
    userOrFailure.fold(
      (failure) => state = AuthState.loggedOut,
      (user) => state = AuthState.loggedIn,
    );
  }

  Future<void> onSignUp(SignUpParams params) async {
    state = AuthState.isSigningUp;
    final userOrFailure = await signUp(params);
    userOrFailure.fold((Failure failure) => state = AuthState.loggedOut,
        (User user) => AuthState.isLoggingIn);
  }
}

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) =>
        AuthController(
            login: ref.watch(loginProvider),
            signUp: ref.watch(signUpProvider)));

enum AuthState {
  idle,
  otpEmailSent,
  otpEmailFailed,
  isLoggingIn,
  loggedIn,
  loggedOut,
  isSigningUp
}
