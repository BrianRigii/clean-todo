import 'package:clean_todo/core/routing/go_router.dart';
import 'package:clean_todo/core/supabase/supabase_client.dart';
import 'package:clean_todo/core/utils/state_logger.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initSupabase();
  runApp(const ProviderScope(observers: [StateLogger()], child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
    );
  }
}
