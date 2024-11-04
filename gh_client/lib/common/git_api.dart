import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:io';
import 'package:dio/io.dart';
import '../models/user.dart';

class Git {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.github.com",
    ),
  );

  static void init() {
    dio.interceptors.add(Global.netCache);
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    if (!Global.isRelease) {
      (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
          (cert, host, port) => true;
    }
  }

  Future<User> Login(String login, String password) async {
    // final authBytes = utf8.encode('$login:$pwd');
    // final authToken = 'Basic ${base64.encode(authBytes)}';
    // var r = await dio.get(
    //   "/user",
    //   options: _options.copyWith(headers: {
    //     //HttpHeaders.authorizationHeader: basic
    //     'Authorization': authToken,
    //   }, extra: {
    //     "noCache": true, //本接口禁用缓存
    //   }),
    // );
    // print("response: $r");
    // // 登录成功后更新公共头(authorization), 此后的所有请求都会带上用户身份信息
    // dio.options.headers[HttpHeaders.authorizationHeader] == authToken;
    // // 清空所有缓存
    // Global.netCache.cache.clear();
    // // 更新profile中token信息
    // Global.profile.token = authToken;
    // return User.fromJson(r.data);
  }
}
