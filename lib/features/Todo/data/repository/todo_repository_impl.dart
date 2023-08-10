import 'package:clean_todo/features/Todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  CreateTodoEither createTodo(Map<String, String> data) {
    throw UnimplementedError();
  }

  @override
  FetchTodosEither fetchTodo() {
    throw UnimplementedError();
  }
}
