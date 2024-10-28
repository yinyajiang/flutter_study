import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gh_client/models/cache_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "../models/profile.dart";

class Global {
  static late SharedPreferences _prefs;
  static late Profile profile;
  static List<MaterialColor> get themes => <MaterialColor>[
        Colors.blue,
        Colors.cyan,
        Colors.teal,
        Colors.green,
        Colors.red,
      ];
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      profile =
          Profile.fromJson(jsonDecode(_prefs.getString("profile") ?? "{}"));
    } catch (e) {
      profile = Profile()..theme = 0;
    }
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    return;
  }

  static saveProfile() {
    _prefs.setString("profile", jsonEncode(profile.toJson()));
  }
}
