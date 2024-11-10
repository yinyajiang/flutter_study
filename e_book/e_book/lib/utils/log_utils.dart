import 'package:flutter/foundation.dart';
import 'dart:developer';

class LogUtils {
  static bool isOpenLog = kDebugMode;
  static void println(String msg) {
    if (isOpenLog) {
      debugPrint(msg);
    }
  }

  static void loger(String msg, {StackTrace? stackTrace, int level = 0}) {
    if (isOpenLog) {
      log(msg, stackTrace: stackTrace, level: level);
    }
  }
}
