import 'package:flutter/material.dart';
import 'package:e_book/pages/book_detail/book_detail_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/model/book.dart';
import 'package:e_book/pages/components/my_book_detail_appbar.dart';
import 'package:e_book/pages/components/book_detail_tile/my_book_detail_tile.dart';
import 'package:e_book/pages/components/book_content_tile/my_book_content_tile.dart';
import 'package:e_book/pages/components/author_tile/my_author_tile.dart';
import 'package:e_book/pages/components/book_review_tile/my_book_review_tile.dart';
import 'package:e_book/pages/components/book_tile/my_book_tile.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;
  const BookDetailPage({super.key, required this.book});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final BookDetailViewModel _viewModel = BookDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160.h),
          child: _getAppBarUI(),
        ),
        body: _getBodyUI(),
      ),
    );
  }

  Widget _getAppBarUI() {
    return MyBookDetailAppBar(
      book: widget.book,
      topActions: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //返回按钮
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),

          //网页链接
          IconButton(
            tooltip: '在线链接',
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.link,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBodyUI() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //定价、页数、评分
          const MyBookDetailTile(
            labels: ['定价', '页数', '评分'],
            data: ['20', '2000', '4.5'],
          ),

          30.verticalSpace,

          //简介
          Selector<BookDetailViewModel, String?>(
            selector: (context, viewModel) => viewModel.content,
            builder: (context, content, child) {
              return MyBookContentTile(
                content: content,
                labelTitle: '当前版本有售',
                labels: const ['当前版本有售', '当前版本有售', '当前版本有售'],
              );
            },
          ),

          30.verticalSpace,

          //作者
          Selector<BookDetailViewModel, List<String>?>(
            selector: (context, viewModel) => viewModel.authors,
            builder: (context, authors, child) {
              return MyAuthorTile(authors: authors);
            },
          ),

          30.verticalSpace,

          //评论
          Selector<BookDetailViewModel, List<String>?>(
            selector: (context, viewModel) => viewModel.reviews,
            builder: (context, reviews, child) {
              return MyBookReviewTile(reviews: reviews);
            },
          ),

          //相似书籍
          Selector<BookDetailViewModel, List<Book>?>(
            selector: (context, viewModel) => viewModel.similarBooks,
            builder: (context, books, child) {
              return MyBookTile(
                books: books,
                title: '特别为您准备',
                width: 120.w,
                height: 160.h,
                onTap: (book) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book)));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
