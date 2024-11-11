import '../dio_instance.dart';
import 'api_string.dart';
import 'package:html/parser.dart';
import '../../model/activity.dart';

class SpiderApi {
  static SpiderApi? _instance;

  SpiderApi._();

  static SpiderApi instance() {
    return _instance ??= SpiderApi._();
  }

  Future<List<Activity>> fetchHomeData() async {
    String htmlStr = await DioInstance.instance()
        .getString(path: ApiString.bookDoubanHomeUrl);
    var doc = parse(htmlStr);
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
