import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/model/book.dart';

class MyBookDetailAppBar extends StatefulWidget {
  final Book book;
  const MyBookDetailAppBar({super.key, required this.book});

  @override
  State<MyBookDetailAppBar> createState() => _MyBookDetailAppBarState();
}

class _MyBookDetailAppBarState extends State<MyBookDetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Stack(
        children: [
          //背景
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.book.cover ?? "",
                  headers: const {
                    "User-Agent": ApiString.ua,
                  },
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
