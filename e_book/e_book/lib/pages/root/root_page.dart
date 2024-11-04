import 'package:e_book/pages/douban_store/douban_store_page.dart';
import 'package:e_book/pages/ebook_store/ebook_store_page.dart';
import 'package:e_book/pages/home/home_page.dart';
import 'package:e_book/pages/my_ebook/my_book_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;
  final rootApp = [
    {
      "icon": LineIcons.home,
      "title": "首页",
    },
    {
      "icon": LineIcons.book,
      "title": "豆瓣读书",
    },
    {
      "icon": LineIcons.shoppingBag,
      "title": "电子书城",
    },
    {
      "icon": LineIcons.user,
      "title": "我的",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: LazyLoadIndexedStack(
        index: index,
        children: const [
          HomePage(),
          DoubanStorePage(),
          EbookStorePage(),
          MyBookPage(),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: index,
      onTap: (i) {
        setState(() {
          index = i;
        });
      },
      items: List.generate(
        rootApp.length,
        (index) => SalomonBottomBarItem(
          selectedColor: Theme.of(context).colorScheme.onSurface,
          unselectedColor: Theme.of(context).colorScheme.inversePrimary,
          icon: Icon(rootApp[index]["icon"] as IconData),
          title: Text(rootApp[index]["title"] as String),
        ),
      ),
    );
  }
}
