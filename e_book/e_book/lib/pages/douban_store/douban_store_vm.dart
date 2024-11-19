import 'package:e_book/http/spider/spider_api.dart';
import 'package:flutter/material.dart';
import 'package:e_book/http/spider/spider_api.dart';
import 'package:e_book/model/book.dart';

class DoubanStoreViewModel extends ChangeNotifier {
  List<Book>? _expressBooks;
  List<Book>? _weeklyBooks;
  List<Book>? _top250Books;

  List<Book>? get expressBooks => _expressBooks;
  List<Book>? get weeklyBooks => _weeklyBooks;
  List<Book>? get top250Books => _top250Books;

  set expressBooks(List<Book>? value) {
    _expressBooks = value;
    notifyListeners();
  }

  set weeklyBooks(List<Book>? value) {
    _weeklyBooks = value;
    notifyListeners();
  }

  set top250Books(List<Book>? value) {
    _top250Books = value;
    notifyListeners();
  }

  Future<void> getDoubanStoreData() async {
    expressBooks = await SpiderApi.instance().fetchBookExpress();
    await SpiderApi.instance().fetchDoubanStoreData(
      (values) => weeklyBooks = values,
      (values) => top250Books = values,
    );
  }
}
