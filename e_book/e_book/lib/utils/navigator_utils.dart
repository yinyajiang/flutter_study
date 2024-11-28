import 'package:e_book/pages/book_detail/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:e_book/model/book.dart';

class NavigatorUtils {
  static void nav2BookDetailPage(BuildContext context, {required Book book}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
          book: book,
        ),
      ),
    );
  }
}
