import 'package:clean_todo/core/api/dio.dart';
import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../models/Todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<TodoModel> postTodo(Map<String, String> data);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final Dio dio;

  TodoRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = (await dio.get('/todos')).data;
      return response.map((e) => TodoModel.fromJson(e)).toList();
    } catch (exception) {
      if (exception is DioException)
        throw ServerException.fromDioException(exception);

      rethrow;
    }
  }

  @override
  Future<TodoModel> postTodo(Map<String, String> data) async {
    try {
      final response = (await dio.post('/todos', data: data)).data;
      return TodoModel.fromJson(response);
    } catch (exception) {
      if (exception is DioException)
        throw ServerException.fromDioException(exception);

      rethrow;
    }
  }
}

final todoRemoteDataSourceProvider =
    Provider.autoDispose<TodoRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return TodoRemoteDataSourceImpl(dio: dio);
});
