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
