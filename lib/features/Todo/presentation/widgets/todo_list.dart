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
    return ref.watch(getTodosProvider).when(
        data: (Either<Failure, List<Todo>> data) {
          return data.fold(
              (Failure failure) => Text('A failure occured'),
              (List<Todo> todos) => ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) => Text(todos[index].title)));
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())));
  }
}