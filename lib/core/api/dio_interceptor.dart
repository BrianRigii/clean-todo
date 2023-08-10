import 'dart:developer';

import 'package:dio/dio.dart';

import '../utils/form_data_util.dart';

class DioInterceptor extends Interceptor {
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("REQUEST : ${options.uri.path} ${(options.data is FormData ? formDataToMap(options.data) : options.data) ?? options.queryParameters}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log("RESPONSE : ${response.requestOptions.uri.path} ${(response.data is FormData ? formDataToMap(response.data) : response.data)}");
    log("RESPONSE : ${response.requestOptions.uri.path}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      "ERROR_BODY $err ${err.requestOptions.uri.path} ${(err.response?.data is FormData ? formDataToMap(err.response?.data) : err.response?.data)}",
    );
    return super.onError(err, handler);
  }
}
