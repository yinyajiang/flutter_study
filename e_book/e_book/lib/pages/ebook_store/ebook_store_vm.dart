import 'package:e_book/http/spider/spider_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_book/model/book.dart';
import 'package:e_book/model/ebook_category.dart';

class EbookStoreViewModel extends ChangeNotifier {
  List<Book>? _recommend;
  List<EBookCategory>? _categories;

  List<Book>? get recommend => _recommend;
  List<EBookCategory>? get categories => _categories;

  set recommend(List<Book>? value) {
    _recommend = value;
    notifyListeners();
  }

  set categories(List<EBookCategory>? value) {
    _categories = value;
    notifyListeners();
  }

  Future getEBookStoreData() async {
    await SpiderApi.instance().fetchEBookStoreData(
      recommendCallback: (List<Book> values) {
        recommend = values;
      },
      categoriesCallback: (List<EBookCategory> values) {
        categories = values;
      },
    );
  }
}
