import 'package:clean_todo/core/api/dio.dart';
import 'package:clean_todo/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> params);
  Future<UserModel> signUp(Map<String, dynamic> params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(Map<String, dynamic> params) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(Map<String, dynamic> params) async {
    try {
      final response = await dio.post('/auth/signup', data: params);
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

final authRemoteDataSourceProvider = Provider.autoDispose<AuthRemoteDataSource>(
    (ref) => AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider)));
