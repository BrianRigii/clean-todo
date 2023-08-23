import '../../todo_priority.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final TodoPriority priority;
  final bool isComplete;
  final DateTime createdAt;
  DateTime? updatedAt;
  final bool synced;

  Todo({
    required this.id,
    required this.title,
    this.description,
    required this.priority,
    required this.isComplete,
    required this.createdAt,
    this.updatedAt,
    this.synced = false,
  });
}
