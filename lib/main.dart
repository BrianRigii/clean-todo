import 'package:clean_todo/core/utils/state_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'core/routing/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      observers: const [StateLogger()],
      child: MaterialApp(
        title: 'Clean Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Text('Lolo'),
        ),
      ),
    );
  }
}
