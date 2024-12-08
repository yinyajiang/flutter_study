import 'package:e_book/http/spider/api_string.dart';

enum BookExpressTag {
  all('全部', 'all'),
  newBook('新书速递', 'new'),
  weeklyHot('一周热门', 'weekly'),
  top250('Top250', 'top250'),
  ;

  const BookExpressTag(this.name, this.value);

  final String name;
  final String value;
}

enum EBookType {
  recommend('.featured-books', ApiString.ebookUrl),
  category('.discount-books', ApiString.ebookDiscountJsonUrl),
  newWorks('.new-works', ApiString.ebookNewPressJsonUrl),
  ;

  const EBookType(this.clz, this.api);

  final String clz;
  final String api;
}
