import 'package:e_book/model/book.dart';
import 'package:flutter/material.dart';

class BookDetailViewModel extends ChangeNotifier {
  Book? _book;
  String? _content; //简介内容
  List<String>? _authors; //作者
  List<String>? _reviews; //评论
  List<Book>? _similarBooks; //相似书籍

  Book? get book => _book;
  String? get content => _content;
  List<String>? get authors => _authors;
  List<String>? get reviews => _reviews;
  List<Book>? get similarBooks => _similarBooks;

  set book(Book? book) {
    _book = book;
    notifyListeners();
  }

  set content(String? content) {
    _content = content;
    notifyListeners();
  }

  set authors(List<String>? authors) {
    _authors = authors;
    notifyListeners();
  }

  set reviews(List<String>? reviews) {
    _reviews = reviews;
    notifyListeners();
  }

  set similarBooks(List<Book>? similarBooks) {
    _similarBooks = similarBooks;
    notifyListeners();
  }
}
