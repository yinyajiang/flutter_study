import '../dio_instance.dart';
import 'api_string.dart';
import 'package:html/parser.dart';
import '../../model/activity.dart';
import 'package:html/dom.dart';
import '../../model/book.dart';
import '../../model/types.dart';

class SpiderApi {
  static SpiderApi? _instance;

  SpiderApi._();

  static SpiderApi instance() {
    return _instance ??= SpiderApi._();
  }

  Future<List<Book>> fetchBookExpress() async {
    var response = await DioInstance.instance().get(
      path: ApiString.bookExpressJsonUrl,
      param: {"tag": BookExpressTag.all.value},
    );
    String htmlStr = response.data['result'];
    var doc = parse(htmlStr);
    return parseBooks(doc);
  }

  Future fetchDoubanStoreData(
    Function(List<Book>? values)? weaklyBooksCallback,
    Function(List<Book>? values)? top250BooksCallback,
  ) async {
    var doc = parse(await DioInstance.instance()
        .getString(path: ApiString.bookDoubanHomeUrl));
    weaklyBooksCallback?.call(parseWeeklyBooks(doc));
    top250BooksCallback?.call(parseTop250Books(doc));
  }

  Future<List<Activity>> fetchBookActivities(int? kind) async {
    Map<String, dynamic>? param = kind == null ? null : {"kind": kind};
    var response = await DioInstance.instance().get(
      path: ApiString.bookActivitiesJsonUrl,
      param: param,
    );
    String htmlStr = response.data['result'];
    var doc = parse(htmlStr);
    return parseActivities(doc);
  }

  Future fetchHomeData({
    Function(List<Activity>)? activitiesCallback,
    Function(List<String>)? activityLabelsCallback,
    Function(List<Book>)? booksCallback,
  }) async {
    var doc = parse(await DioInstance.instance()
        .getString(path: ApiString.bookDoubanHomeUrl));
    activitiesCallback?.call(parseActivities(doc));
    activityLabelsCallback?.call(parseActivityLabels(doc));
    booksCallback?.call(parseBooks(doc));
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

  List<Book> parseBooks(Document doc) {
    List<Book> books = [];
    var ulEl = doc.querySelectorAll('.books-express .bd .slide-item')[0];
    ulEl.querySelectorAll('li').forEach((li) {
      var a = li.querySelector('a');
      books.add(Book(
        id: ApiString.getId(a?.attributes['href'] ?? "", ApiString.bookIdReg),
        cover: a?.querySelector('img')?.attributes['src'] ?? "",
        title: li.querySelector('.info .title a')?.text.trim() ?? "",
        authorName: li.querySelector('.info .author')?.text.trim() ?? "",
      ));
    });
    return books;
  }

  List<Book> parseWeeklyBooks(Document doc) {
    var liEls = doc.querySelectorAll('.popular-books .bd ul li');
    return liEls.map((li) {
      String? cover = li.querySelector('.cover img')?.attributes['src'];
      var aEl = li.querySelector('.title a');
      String? title = aEl?.innerHtml.trim();
      String? id =
          ApiString.getId(aEl?.attributes['href'] ?? "", ApiString.bookIdReg);
      String? authorName = li.querySelector('.author')?.innerHtml.trim() ?? "";
      authorName = authorName.replaceFirst('作者:', '');
      String? subtitle;
      if (title != null && title.isNotEmpty) {
        List titles = title.split('：');
        if (titles.length > 1) {
          title = titles[0];
          subtitle = titles[1];
        } else {
          subtitle = authorName;
        }
      }
      double rate = parseRate(li.querySelector('.average-rating')?.text.trim());
      return Book(
        id: id,
        cover: cover,
        title: title,
        authorName: authorName,
        rate: rate,
        subtitle: subtitle,
      );
    }).toList();
  }

  double parseRate(String? rateStr) {
    if (rateStr == null || rateStr.isEmpty) {
      return 0;
    }
    try {
      return double.parse(rateStr);
    } catch (_) {
      return 0;
    }
  }

  List<Book> parseTop250Books(Document doc) {
    var elEles = doc.querySelectorAll('#book_rec dl');
    return elEles.map((dl) {
      var aEl = dl.children[0].children[0];
      String? cover = aEl.children[0].attributes['src'];
      String? id =
          ApiString.getId(aEl.attributes['href'] ?? "", ApiString.bookIdReg);
      return Book(
        id: id,
        cover: cover,
        title: dl.children[1].children[0].text.trim(),
      );
    }).toList();
  }
}
