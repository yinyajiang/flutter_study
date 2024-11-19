import 'package:e_book/pages/components/book_tile/my_book_tile.dart';
import 'package:e_book/pages/components/my_search_tile.dart';
import 'package:flutter/material.dart';
import 'douban_store_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/model/book.dart';

class DoubanStorePage extends StatefulWidget {
  const DoubanStorePage({super.key});

  @override
  State<DoubanStorePage> createState() => _DoubanStorePageState();
}

class _DoubanStorePageState extends State<DoubanStorePage> {
  final DoubanStoreViewModel _viewModel = DoubanStoreViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.getDoubanStoreData();
  }

  @override
  Widget build(BuildContext context) {
    Color surface = Theme.of(context).colorScheme.surface;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            backgroundColor: surface,
            surfaceTintColor: surface,
          ),
          backgroundColor: surface,
          body: _getBodyUI(),
        );
      },
    );
  }

  Widget _getBodyUI() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            //搜索
            const MySearchTile(),
            30.verticalSpace,

            //新书速递
            Selector<DoubanStoreViewModel, List<Book>?>(
              selector: (context, viewModel) => _viewModel.expressBooks,
              builder: (context, books, child) {
                return MyBookTile(
                  books: books,
                  title: '新书速递',
                  width: 120.w,
                  height: 160.h,
                  showRate: true,
                );
              },
            ),
            30.verticalSpace,
            //一周热门

            Selector<DoubanStoreViewModel, List<Book>?>(
              selector: (context, viewModel) => _viewModel.weeklyBooks,
              builder: (context, books, child) {
                return MyBookTile(
                  books: books,
                  title: '一周热门',
                  width: 120.w,
                  height: 160.h,
                );
              },
            ),
            30.verticalSpace,

            //Top250
            Selector<DoubanStoreViewModel, List<Book>?>(
              selector: (context, viewModel) => _viewModel.top250Books,
              builder: (context, books, child) {
                return MyBookTile(
                  books: books,
                  title: 'Top250',
                  width: 120.w,
                  height: 160.h,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
