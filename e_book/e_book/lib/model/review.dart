import 'author.dart';

class Review {
  Review({
    this.id,
    this.author,
    this.rate,
    this.short,
    this.date,
    this.url,
  });

  String? id;
  Author? author;
  double? rate;
  String? short;
  String? date;
  String? url;

  static const rateMap = {
    '力荐': 10.0,
    '推荐': 8.0,
    '还行': 6.0,
    '较差': 4.0,
    '很差': 2.0,
  };

  static double? getRate(String? rateStr) {
    if (rateStr == null) return 0.0;
    return rateMap[rateStr];
  }
}
