import 'dart:developer';

import 'package:clean_todo/features/auth/domain/usecases/login.dart';
import 'package:clean_todo/features/auth/domain/usecases/otp_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final Login login;
  final OtpSignIn otpSignIn;

  AuthController({required this.login, required this.otpSignIn})
      : super(AuthState.idle);

  Future<void> onlogin(LoginParams params) async {
    state = AuthState.isLoggingIn;
    final userOrFailure = await login(params);
    userOrFailure.fold(
      (failure) => state = AuthState.loggedOut,
      (user) => state = AuthState.loggedIn,
    );
  }

  Future<void> signUpWithOtp(String params) async {
    state = AuthState.isLoggingIn;
    try {
      await otpSignIn(params);
      state = AuthState.otpEmailSent;
    } catch (e, stack) {
      log('error is $e $stack');
      state = AuthState.otpEmailFailed;
    }
  }
}

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>(
        (ref) => AuthController(
              login: ref.watch(loginProvider),
              otpSignIn: ref.watch(otpSignInProvider),
            ));

enum AuthState {
  idle,
  otpEmailSent,
  otpEmailFailed,
  isLoggingIn,
  loggedIn,
  loggedOut,
}
