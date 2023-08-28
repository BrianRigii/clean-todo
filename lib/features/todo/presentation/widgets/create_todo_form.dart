import 'package:clean_todo/features/todo/todo_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPriorityProvider =
    StateProvider.autoDispose<TodoPriority>((ref) => TodoPriority.low);

class CreateTodoForm extends ConsumerStatefulWidget {
  const CreateTodoForm({super.key});

  @override
  ConsumerState<CreateTodoForm> createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends ConsumerState<CreateTodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 8),
            const Text('Priority'),
            Row(
              children: [
                const Text('Low'),
                Radio<TodoPriority>(
                    value: TodoPriority.low,
                    groupValue: TodoPriority.low,
                    onChanged: (value) {
                      // ref.read(selectedPriorityProvider).state = value!;
                    }),
                const Text('Medium'),
                Radio<TodoPriority>(
                    value: TodoPriority.medium,
                    groupValue: TodoPriority.low,
                    onChanged: (value) {
                      // ref.read(selectedPriorityProvider).state = value!;
                    }),
                const Text('High'),
                Radio<TodoPriority>(
                    value: TodoPriority.high,
                    groupValue: TodoPriority.low,
                    onChanged: (value) {
                      // ref.read(selectedPriorityProvider).state = value!;
                    }),
              ],
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            )
          ],
        ));
  }
}
