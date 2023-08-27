import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  createTaskBtnFn() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Placeholder(),
        ElevatedButton(
          onPressed: createTaskBtnFn,
          child: const Text('Create Task'),
        )
      ],
    );
  }
}
