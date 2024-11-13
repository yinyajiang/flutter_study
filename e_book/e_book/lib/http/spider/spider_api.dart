import '../dio_instance.dart';
import 'api_string.dart';
import 'package:html/parser.dart';
import '../../model/activity.dart';
import 'package:html/dom.dart';

class SpiderApi {
  static SpiderApi? _instance;

  SpiderApi._();

  static SpiderApi instance() {
    return _instance ??= SpiderApi._();
  }

  Future fetchHomeData({
    Function(List<Activity>)? activitiesCallback,
    Function(List<String>)? activityLabelsCallback,
  }) async {
    var doc = parse(await DioInstance.instance()
        .getString(path: ApiString.bookDoubanHomeUrl));
    activitiesCallback?.call(parseActivities(doc));
    activityLabelsCallback?.call(parseActivityLabels(doc));
  }

  List<String> parseActivityLabels(Document doc) {
    List<String> labels = [];
    doc.querySelectorAll('.books-activities .hd .tags .item').forEach((a) {
      labels.add(a.text.trim());
    });
    return labels;
  }

  List<Activity> parseActivities(Document doc) {
    var aEls = doc.querySelectorAll('.books-activities .book-activity');
    List<Activity> activities = [];
    for (var a in aEls) {
      String url = a.attributes['href'] ?? "";
      String cover = ApiString.getBookActivityCover(a.attributes['style']);
      String title = a.querySelector('.book-activity-title')?.text.trim() ?? "";
      String label = a.querySelector('.book-activity-label')?.text.trim() ?? "";
      String time =
          a.querySelector('.book-activity-time time')?.text.trim() ?? "";
      activities.add(Activity(
        url: url,
        cover: cover,
        title: title,
        label: label,
        time: time,
      ));
    }
    return activities;
  }
}
