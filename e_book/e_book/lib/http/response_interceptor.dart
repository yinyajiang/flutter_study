import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMsg = "请检查网络";
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      errorMsg = "连接超时，请检查网络连接";
    } else if (err.response?.statusCode == 404) {
      errorMsg = "请求的资源不存在";
    } else if (err.type == DioExceptionType.unknown) {
      errorMsg = "未知错误，请稍后再试";
    }
    debugPrint(errorMsg);
    //ToastUtil.showToast(errorMsg);
    return handler.next(err);
  }
}
