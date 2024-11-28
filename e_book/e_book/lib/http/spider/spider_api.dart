import '../dio_instance.dart';
import 'api_string.dart';
import 'package:html/parser.dart';
import '../../model/activity.dart';
import 'package:html/dom.dart';
import '../../model/book.dart';
import '../../model/types.dart';
import '../../model/author.dart';
import '../../model/review.dart';

class SpiderApi {
  static SpiderApi? _instance;

  SpiderApi._();

  static SpiderApi instance() {
    return _instance ??= SpiderApi._();
  }

  Future fetchBookDetail(
    Book value, {
    Function(Book?)? bookCallback,
    Function(List<Author>?)? authorsCallback,
    Function(List<Review>?)? reviewsCallback,
    Function(List<Book>?)? similarBooksCallback,
  }) async {
    var doc = parse(await DioInstance.instance()
        .getString(path: "${ApiString.bookDetailUrl}${value.id}"));
    bookCallback?.call(parseBookDetail(value, doc));
    authorsCallback?.call(parseAuthors(doc));
    reviewsCallback?.call(parseReviews(doc));
    similarBooksCallback?.call(parseSimilarBooks(doc));
  }

  Book parseBookDetail(Book value, Document doc) {
    Element? divEl = doc.querySelector('.subjectwrap');
    if (divEl == null) return value;
    String text = divEl.querySelector('#info')?.text.trim() ?? "";
    value.page = ApiString.getBookPage(text);
    value.price = ApiString.getBookPrice(text);
    value.rate = parseRate(divEl.querySelector('.rating_num')?.text.trim());

    String desc =
        doc.querySelector('.related_info .all .intro')?.text.trim() ?? "";
    if (desc.isEmpty) {
      desc = doc.querySelector('.related_info .intro')?.text.trim() ?? "";
    }
    value.description = desc;

    List<Element> buyInfoEls = doc.querySelectorAll('.buyinfo ul li');
    value.buyInfo = buyInfoEls.map((el) {
      String priceStr =
          el.querySelector('.price-wrapper .buylink-price')?.text.trim() ?? "";
      priceStr = priceStr.replaceFirst("元", "");
      return BuyInfo(
        name: el.querySelector('.vendor-name span')?.text.trim(),
        price: parseRate(priceStr),
        url: el.querySelector('.vendor-name a')?.attributes['href'] ?? "",
      );
    }).toList();
    return value;
  }

  List<Author> parseAuthors(Document doc) {
    List<Element> aEls = doc.querySelectorAll(".authors-list .author");
    List<Author> authors = [];
    for (int i = 0; i < aEls.length - 1; i++) {
      Element el = aEls[i];
      String id = ApiString.getId(
          el.children[0].attributes['href'] ?? "", ApiString.authorIdRegExp);
      Element infoEl = el.children[1];
      authors.add(Author(
        id: id,
        name: infoEl.children[0].text.trim(),
        role: infoEl.children[1].text.trim(),
        avatar: el.children[0].children[0].attributes['src'] ?? "",
      ));
    }
    return authors;
  }

  List<Review> parseReviews(Document doc) {
    var itemEls = doc.querySelectorAll('.review-list .review-item');
    List<Review> reviews = [];
    int count = 0;
    for (int i = 0; i < itemEls.length; i++) {
      if (count > 4) break;
      Element item = itemEls[i];
      Element hdEl = item.children[0];
      Element bdEl = item.children[1];
      Author author = Author(
        name: hdEl.querySelector(".name")?.text.trim() ?? "",
        avatar: hdEl.querySelector(".avator img")?.attributes['src'] ?? "",
      );
      var rate = Review.getRate(
          hdEl.querySelector(".main-title-rating")?.attributes['title']);
      String short = bdEl.querySelector(".short-content")?.text.trim() ?? "";
      short = short.replaceFirst("(展开)", "").trim();
      reviews.add(Review(
        author: author,
        rate: rate,
        short: short,
      ));
      count++;
    }
    return reviews;
  }

  List<Book> parseSimilarBooks(Document doc) {
    List<Element> dlEls = doc.querySelectorAll('#db-rec-section .content dl');
    List<Book> books = [];
    for (var dl in dlEls) {
      if (dl.className == "clear") continue;
      String? cover = dl.querySelector('img.m_sub_img')?.attributes['src'];
      Element? aEl = dl.querySelector('dd a');
      String? title = aEl?.text.trim();
      String id =
          ApiString.getId(aEl?.attributes['href'] ?? "", ApiString.bookIdReg);
      double rate = parseRate(dl.querySelector('.subject-rate')?.text.trim());
      books.add(Book(
        id: id,
        cover: cover,
        title: title,
        rate: rate,
      ));
    }
    return books;
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
