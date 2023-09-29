import 'package:dio/dio.dart';

class DioOptions extends BaseOptions {
  DioOptions()
      : super(
          baseUrl: 'https://clean-todo-backend-production.up.railway.app',
          contentType: 'application/json',
          responseType: ResponseType.json,
        );
}
