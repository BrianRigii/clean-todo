import 'package:dio/dio.dart';

class DioOptions extends BaseOptions {
  DioOptions()
      : super(
          baseUrl: 'https://crudcrud.com/api/ebc797ceb2c647c6a6443b7d971cc669',
          contentType: 'application/json',
          responseType: ResponseType.json,
        );
}
