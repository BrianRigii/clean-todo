// import '../entities/todo.dart';

import 'package:clean_todo/core/either/either.dart';

import '../../../../core/errors/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  FetchTodosEither fetchTodos();
  CreateTodoEither createTodo(Map<String, String> data);
}

typedef FetchTodosEither = Future<Either<Failure, List<Todo>>>;
typedef CreateTodoEither = Future<Either<Failure, Todo>>;
