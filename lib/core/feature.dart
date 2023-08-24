import 'package:clean_todo/features/auth/auth_feature.dart';
import 'package:clean_todo/features/dashboard/dashboard_feature.dart';
import 'package:clean_todo/features/onboarding/onboarding_feature.dart';
import 'package:go_router/go_router.dart';

List<Feature> features = [
  AuthFeature(),
  OnBoardingFeature(),
  DashBoardFeature(),
];

abstract class Feature {
  List<RouteBase> get routes;
}
