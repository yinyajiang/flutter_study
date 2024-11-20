import 'package:e_book/model/book.dart';
import 'package:flutter/material.dart';

class BookDetailViewModel extends ChangeNotifier {
  Book? _book;

  Book? get book => _book;

  void setBook(Book? book) {
    _book = book;
    notifyListeners();
  }
}
