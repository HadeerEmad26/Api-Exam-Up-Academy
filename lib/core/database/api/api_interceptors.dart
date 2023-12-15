import 'package:apiexam/core/database/api/end_points.dart';
import 'package:apiexam/core/database/cache_helper/cache_helper.dart';
import 'package:dio/dio.dart';

import '../../services/service_locator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
