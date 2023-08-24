import 'package:clean_todo/features/todo/todo_priority.dart';

import '../../../../core/contracts/usecase.dart';
import '../repository/todo_repository.dart';

class PostTodo extends UseCase<CreateTodoEither, PostTodoData> {
  final TodoRepository repository;

  PostTodo(
    this.repository,
  );

  @override
  CreateTodoEither call(PostTodoData params) async {
    return await repository.createTodo(params.toJson());
  }
}

class PostTodoData {
  final String? id;
  final String title;
  final String? description;
  final TodoPriority priority;
  final bool isComplete;
  final DateTime createdAt;

  PostTodoData(
      {this.id,
      required this.title,
      required this.description,
      required this.priority,
      this.isComplete = false,
      required this.createdAt});

  copyWith(String id) => PostTodoData(
      id: id,
      title: title,
      description: description,
      priority: priority,
      isComplete: isComplete,
      createdAt: createdAt);

  Map<String, dynamic> toJson() => Map.unmodifiable({
        'id': id,
        'title': title,
        'description': description,
        'priority': priority.index,
        'isComplete': isComplete,
        'createdAt': createdAt.toIso8601String(),
      });
}
