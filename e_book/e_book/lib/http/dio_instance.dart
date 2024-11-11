import 'package:dio/dio.dart';
import 'response_interceptor.dart';
import 'print_log_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();
  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  static const _defaultTimeout = Duration(seconds: 30);

  DioInstance({
    Duration connectTimeout = _defaultTimeout,
    Duration receiveTimeout = _defaultTimeout,
    Duration sendTimeout = _defaultTimeout,
    ResponseType responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      responseType: responseType,
      contentType: contentType,
    );
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
  }

  Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.get(
      path,
      data: data,
      queryParameters: param,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<String> getString({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var res = await _dio.get<String>(
      path,
      data: data,
      queryParameters: param,
      options: options,
      cancelToken: cancelToken,
    );
    return res.data ?? '';
  }

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.post(
      path,
      data: data,
      queryParameters: param,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
