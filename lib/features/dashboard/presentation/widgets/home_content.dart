import 'package:clean_todo/features/todo/presentation/controllers/todo_controller.dart';
import 'package:clean_todo/features/todo/presentation/states/todo_states.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  createTaskBtnFn() {
    ref.read(todoControllerProvider.notifier).onOpenCreateTodoForm();
  }

  void _handleStates(TodoState state) {
    if (state is OnOpenCreateTodoFormState) {
      showModalBottomSheet(
          context: context, builder: (context) => const Placeholder());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<TodoState>(todoControllerProvider, (state, next) {
      _handleStates(next);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TodoList(),
        ElevatedButton(
          onPressed: createTaskBtnFn,
          child: const Text('Create Task'),
        )
      ],
    );
  }
}
