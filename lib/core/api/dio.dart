import 'package:clean_todo/core/api/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import 'dio_options.dart';

final AutoDisposeProvider<Dio> dioProvider = Provider.autoDispose<Dio>((ref) {
  Dio dio = Dio(DioOptions());

  dio.interceptors.add(DioInterceptor());

  return dio;
});
