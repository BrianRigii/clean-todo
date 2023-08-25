import 'package:clean_todo/core/contracts/usecase.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';

class OtpSignIn extends UseCase<Future<void>, String> {
  final AuthRepository repository;

  OtpSignIn(this.repository);

  @override
  Future<void> call(String params) async {
    return await repository.signInWithOtp(params);
  }
}
