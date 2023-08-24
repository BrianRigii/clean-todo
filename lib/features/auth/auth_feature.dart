import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/features/auth/presentation/screens/auth_screen.dart';
import 'package:go_router/go_router.dart';

class AuthFeature extends Feature {
  @override
  List<RouteBase> routes = [
    GoRoute(
        path: AuthScreen.path, builder: (context, state) => const AuthScreen())
  ];
}
