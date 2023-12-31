import 'package:clean_todo/features/todo/presentation/states/todo_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoController extends StateNotifier<TodoState> {
  TodoController() : super(TodoInitialState());

  void toggleCreateTodoForm() {
    state = OnOpenCreateTodoFormState();
  }

  void closeCreateTodoForm() {}

  void createTodo() {}
}

final todoControllerProvider =
    StateNotifierProvider<TodoController, TodoState>((ref) {
  return TodoController();
});
