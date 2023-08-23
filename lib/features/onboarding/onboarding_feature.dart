import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class OnBoardingFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        GoRoute(
            path: SplashScreen.path,
            builder: (context, state) => const SplashScreen())
      ];
}
