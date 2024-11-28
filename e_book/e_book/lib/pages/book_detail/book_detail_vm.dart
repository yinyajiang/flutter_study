import 'package:e_book/http/spider/spider_api.dart';
import 'package:e_book/model/book.dart';
import 'package:flutter/material.dart';
import 'package:e_book/model/author.dart';
import 'package:e_book/model/review.dart';

class BookDetailViewModel extends ChangeNotifier {
  Book? _book;
  List<Author>? _authors; //作者
  List<Review>? _reviews; //评论
  List<Book>? _similarBooks; //相似书籍

  Book get book => _book ?? Book();
  List<Author>? get authors => _authors;
  List<Review>? get reviews => _reviews;
  List<Book>? get similarBooks => _similarBooks;

  set book(Book book) {
    _book = book;
    notifyListeners();
  }

  set authors(List<Author>? authors) {
    _authors = authors;
    notifyListeners();
  }

  set reviews(List<Review>? reviews) {
    _reviews = reviews;
    notifyListeners();
  }

  set similarBooks(List<Book>? similarBooks) {
    _similarBooks = similarBooks;
    notifyListeners();
  }

  Future getBookDetail(Book b) async {
    await SpiderApi.instance().fetchBookDetail(
      b,
      bookCallback: (value) => book = value ?? book,
      authorsCallback: (value) => authors = value,
      reviewsCallback: (value) => reviews = value,
      similarBooksCallback: (value) => similarBooks = value,
    );
  }
}
