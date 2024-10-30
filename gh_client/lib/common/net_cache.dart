import 'package:dio/dio.dart';

import '../common/global.dart';

class CacheObject {
  CacheObject(this.response) : time = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) =>
      other is CacheObject && hashCode == other.hashCode;

  @override
  int get hashCode => response.realUri.hashCode;

  final Response response;
  int time;
}

class NetCache extends Interceptor {
  var cache = <String, CacheObject>{};

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(Global.profile.cache!.enable ?? true)) {
      return handler.next(options);
    }
    bool refresh = options.extra["refresh"] == true;
    if (refresh) {
      if (options.extra["list"] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        cache.remove(options.uri.toString());
      }
      return handler.next(options);
    }

    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      var maxAge = Global.profile.cache!.maxAge ?? 0;
      if (ob != null &&
          (DateTime.now().millisecondsSinceEpoch - ob.time) / 1000 < maxAge) {
        return handler.resolve(ob.response);
      } else {
        cache.remove(key);
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!(Global.profile.cache!.enable ?? true)) {
      return handler.next(response);
    }
    var options = response.requestOptions;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      if (cache.length >= (Global.profile.cache!.maxCount ?? 0)) {
        cache.remove(cache.keys.first);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = CacheObject(response);
      cache[key] = ob;
    }
    return handler.next(response);
  }
}
