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
  String? rate;
  String? short;
  String? date;
  String? url;
}
