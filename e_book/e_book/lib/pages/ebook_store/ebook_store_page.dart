import 'package:e_book/pages/components/my_search_tile.dart';
import 'package:flutter/material.dart';
import 'package:e_book/pages/ebook_store/ebook_store_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/model/book.dart';
import 'package:e_book/pages/components/book_tile/my_book_tile.dart';
import 'package:e_book/model/ebook_category.dart';
import 'package:e_book/pages/components/ebook_category_tile/my_ebook_category_tile.dart';

class EbookStorePage extends StatefulWidget {
  const EbookStorePage({super.key});

  @override
  State<EbookStorePage> createState() => _EbookStorePageState();
}

class _EbookStorePageState extends State<EbookStorePage> {
  final EbookStoreViewModel _viewModel = EbookStoreViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.getEBookStoreData();
  }

  @override
  Widget build(BuildContext context) {
    Color surface = Theme.of(context).colorScheme.surface;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: surface,
          surfaceTintColor: surface,
        ),
        backgroundColor: surface,
        body: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
          child: _getBodyUI(),
        ),
      ),
    );
  }

  Widget _getBodyUI() {
    return CustomScrollView(
      slivers: [
        //搜索
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: MySearchTile(
              bookshelfTap: () {},
            ),
          ),
        ),

        //推荐
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Selector<EbookStoreViewModel, List<Book>?>(
              selector: (context, viewModel) => viewModel.recommend,
              builder: (context, books, child) {
                return MyBookTile(
                  title: "编辑推荐",
                  showPrice: true,
                  books: books,
                  onTap: (book) {},
                );
              },
            ),
          ),
        ),

        //书签
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Selector<EbookStoreViewModel, List<EBookCategory>?>(
              selector: (context, viewModel) => viewModel.categories,
              builder: (context, categories, child) {
                return MyEbookCategoryTile(
                  title: "书签",
                  categories: categories,
                  itemTap: (category) {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
