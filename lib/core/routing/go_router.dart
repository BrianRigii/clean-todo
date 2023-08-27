import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/core/supabase/supabase_client.dart';
import 'package:clean_todo/features/auth/presentation/screens/auth_screen.dart';
import 'package:clean_todo/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final routerProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: SplashScreen.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      Session? session = ref.read(superbaseClientProvider).auth.currentSession;
      if (session == null) {
        return AuthScreen.path;
      }
      return null;
    },
    routes: features.expand((e) => e.routes).toList()));
