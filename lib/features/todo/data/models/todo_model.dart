import 'package:clean_todo/features/todo/todo_priority.dart';

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final TodoPriority priority;
  final bool isComplete;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int serverId;
  bool synced;

  TodoModel(
      {required this.id,
      required this.title,
      this.description,
      required this.priority,
      this.isComplete = false,
      required this.createdAt,
      required this.serverId,
      this.synced = false,
      this.updatedAt});

  factory TodoModel.fromJson(json) {
    try {
      return TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isComplete: json['isComplete'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        priority: TodoPriority.values[json['priority']],
        synced: true,
        serverId: json['id'],
      );
    } catch (e) {
      throw FormatException('Error parsing TodoModel from json, $e', json);
    }
  }
}
