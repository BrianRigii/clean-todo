// import 'package:clean_todo/core/contracts/usecase.dart';
// import 'package:clean_todo/features/auth/data/repository/auth_repository_impl.dart';
// import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';
// import 'package:riverpod/riverpod.dart';

// class OtpSignIn extends UseCase<Future<void>, String> {
//   final AuthRepository repository;

//   OtpSignIn(this.repository);

//   @override
//   Future<void> call(String params) async {
//     return await repository.signInWithOtp(params);
//   }
// }

// final otpSignInProvider = Provider.autoDispose<OtpSignIn>(
//     (ref) => OtpSignIn(ref.watch(authRepositoryProvider)));
