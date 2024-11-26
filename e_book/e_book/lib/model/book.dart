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
  });

  String? id;
  String? title;
  String? authorName;
  String? cover;
  String? subtitle;
  double? rate;
  String? wordCount;
  String? description;
  List<BuyInfo>? buyInfo;
}

class BuyInfo {
  BuyInfo({
    this.price,
    this.url,
    this.name,
  });

  String? price;
  String? url;
  String? name;
}
