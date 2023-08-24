// import '../entities/todo.dart';

import 'package:clean_todo/core/either/either.dart';

import '../../../../core/errors/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  CreateTodoEither createTodo(Map<String, dynamic> data);
}

typedef CreateTodoEither = Future<Either<Failure, Todo>>;
