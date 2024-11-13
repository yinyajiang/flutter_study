import 'dart:convert';

import 'package:flutter/material.dart';
import '../../http/spider/spider_api.dart';
import '../../model/activity.dart';

class HomeViewModel extends ChangeNotifier {
  List<Activity>? _activities;
  List<String>? _activityLabels;

  List<Activity>? get activities => _activities;
  List<String>? get activityLabels => _activityLabels;

  set activities(List<Activity>? activities) {
    _activities = activities;
    notifyListeners();
  }

  set activityLabels(List<String>? activityLabels) {
    _activityLabels = activityLabels;
    notifyListeners();
  }

  Future getHomePageData() async {
    await SpiderApi.instance().fetchHomeData(
      activitiesCallback: (activities) {
        this.activities = activities;
      },
      activityLabelsCallback: (activityLabels) {
        this.activityLabels = activityLabels;
      },
    );
  }
}
