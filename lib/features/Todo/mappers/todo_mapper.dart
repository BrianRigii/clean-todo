import 'package:clean_todo/features/Todo/data/models/Todo_model.dart';

import '../domain/entities/todo.dart';

extension TodoMapper on TodoModel {
  Todo toEntity() {
    return Todo(
        id: id,
        title: title,
        description: description,
        priority: priority,
        isComplete: isComplete,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}
