import 'package:clean_todo/features/Todo/todo_priority.dart';

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final TodoPriority priority;

  TodoModel(
      {required this.id,
      required this.title,
      this.description,
      required this.priority});

  factory TodoModel.fromJson(json) {
    try {
      return TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        priority: TodoPriority.values[json['priority']],
      );
    } catch (e) {
      throw FormatException('Error parsing TodoModel from json, $e', json);
    }
  }
}
