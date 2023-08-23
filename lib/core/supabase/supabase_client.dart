import 'package:clean_todo/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';

void initSupabase() async {
  await Supabase.initialize(
    url: superbaseUrl,
    anonKey: anonKey,
  );
}

final superbaseClientProvider =
    Provider.autoDispose((ref) => Supabase.instance.client);
