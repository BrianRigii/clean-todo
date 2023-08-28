import 'package:clean_todo/features/todo/presentation/states/todo_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoController extends StateNotifier<TodoState> {
  TodoController() : super(TodoInitialState());

  void toggleCreateTodoForm() {
    if (state == OnOpenCreateTodoFormState) TodoInitialState;
    state = OnOpenCreateTodoFormState();
  }
}

final todoControllerProvider =
    StateNotifierProvider<TodoController, TodoState>((ref) {
  return TodoController();
});
