import 'package:clean_todo/features/todo/data/models/todo_model.dart';

import '../domain/entities/todo.dart';

extension TodoMapper on TodoModel {
  Todo toEntity() {
    return Todo(
        id: id,
        title: title,
        description: description,
        priority: priority,
        isComplete: isComplete,
        createdAt: entryTime,
        updatedAt: updatedAt);
  }
}
