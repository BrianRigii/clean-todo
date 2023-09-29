import 'package:clean_todo/core/either/either.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/auth/data/models/user_model.dart';
import 'package:clean_todo/features/auth/data/sources/auth_remote_datasources.dart';
import 'package:clean_todo/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_todo/features/auth/mappers/user_model_mapper.dart';
import 'package:riverpod/riverpod.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  LoginEither login(Map<String, dynamic> params) async {
    try {
      UserModel userModel = await _remoteDataSource.login(params);
      return Right(userModel.toEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  SignUpEither signUp(Map<String, dynamic> params) async {
    try {
      UserModel userModel = await _remoteDataSource.signUp(params);
      return Right(userModel.toEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        remoteDataSource: ref.watch(authRemoteDataSourceProvider)));
