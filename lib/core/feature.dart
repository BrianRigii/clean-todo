import 'package:clean_todo/features/onboarding/onboarding_feature.dart';
import 'package:go_router/go_router.dart';

List<Feature> features = [
  OnBoardingFeature(),
];

abstract class Feature {
  List<RouteBase> get routes;
}
