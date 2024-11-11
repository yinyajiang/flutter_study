import 'dart:convert';

import 'package:flutter/material.dart';
import '../../http/spider/spider_api.dart';
import '../../model/activity.dart';

class HomeViewModel extends ChangeNotifier {
  List<Activity>? _activities;

  List<Activity>? get activities => _activities;

  set activities(List<Activity>? activities) {
    _activities = activities;
    notifyListeners();
  }

  Future getActivities() async {
    activities = await SpiderApi.instance().fetchHomeData();
    print(activities);
  }
}
