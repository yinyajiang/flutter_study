import 'package:dio/dio.dart';
import 'package:e_book/utils/log_utils.dart';
import 'package:flutter/foundation.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LogUtils.println('\nonRequese--------->');
    options.headers.forEach((key, value) {
      LogUtils.println('headers: key=$key, value=${value.toString()}');
    });
    LogUtils.println('path: ${options.uri}');
    LogUtils.println('method: ${options.method}');
    LogUtils.println('data: ${options.data}');
    LogUtils.println('queryParameters: ${options.queryParameters}');
    LogUtils.println('<---------onRequest\n');

    super.onRequest(options, handler);
  }
}
