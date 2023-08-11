import 'package:clean_todo/core/either/either.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/Todo/domain/usecases/get_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/todo.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final failureOrTodos = ref.watch(getTodosProvider).when(
    //         data: (todos) => AsyncValue.data(todos),
    //         loading: () => const AsyncValue.loading(),
    //         error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    //       );

    return ref.watch(getTodosProvider).when(
        data: (failureOrTodo) => Container(),
        error: (error, stackTrace) => Container(),
        loading: () => Container());
  }
}
