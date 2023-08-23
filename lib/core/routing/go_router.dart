import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: SplashScreen.path,
    debugLogDiagnostics: true,
    routes: features.expand((e) => e.routes).toList()));
