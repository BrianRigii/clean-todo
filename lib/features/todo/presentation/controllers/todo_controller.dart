import 'package:clean_todo/features/todo/presentation/states/todo_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoController extends StateNotifier<TodoState> {
  TodoController() : super(TodoInitialState());

  void onOpenCreateTodoForm() {
    state = OnOpenCreateTodoFormState();
  }
}

final todoControllerProvider =
    StateNotifierProvider<TodoController, TodoState>((ref) {
  return TodoController();
});
