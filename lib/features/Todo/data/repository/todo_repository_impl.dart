import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:clean_todo/core/errors/failures.dart';

import 'package:clean_todo/features/Todo/data/sources/todo_remote_data_source.dart';
import 'package:clean_todo/features/Todo/domain/entities/todo.dart';
import 'package:clean_todo/features/Todo/domain/repository/todo_repository.dart';
import 'package:clean_todo/features/Todo/mappers/todo_mapper.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/either/either.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);
  @override
  CreateTodoEither createTodo(Map<String, dynamic> data) async {
    try {
      final todoModel = await remoteDataSource.postTodo(data);
      return Right(todoModel.toEntity());
    } catch (exception) {
      if (exception is ServerException) return Left(ServerFailure(exception));
      if (exception is FormatException) {
        return Left(InvalidFormatFailure(exception));
      }
      return Left(UnexpectedFailure(
          'Something went wrong while creating a todo',
          exception: exception as Exception,
          stackTrace: StackTrace.current));
    }
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    try {
      final todos = await remoteDataSource.getTodos();
      return todos.map<Todo>((todo) => todo.toEntity()).toList();
    } catch (exception) {
      rethrow;
    }
  }
}

final todoRepositoryProvider = Provider.autoDispose<TodoRepository>((ref) {
  final remoteDataSource = ref.watch(todoRemoteDataSourceProvider);
  return TodoRepositoryImpl(remoteDataSource);
});
