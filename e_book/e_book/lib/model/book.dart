class Book {
  Book({
    this.id,
    this.title,
    this.authorName,
    this.cover,
    this.subtitle,
    this.rate,
    this.wordCount,
    this.description,
    this.buyInfo,
    this.page,
    this.price,
  });

  String? id;
  String? title;
  String? authorName;
  String? cover;
  String? subtitle;
  double? rate;
  String? wordCount;
  String? description;
  int? page;
  double? price;
  List<BuyInfo>? buyInfo;
}

class BuyInfo {
  BuyInfo({
    this.price,
    this.url,
    this.name,
  });

  double? price;
  String? url;
  String? name;
}
