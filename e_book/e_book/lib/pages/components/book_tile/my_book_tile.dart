import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:e_book/model/book.dart';
import 'my_book_tile_item.dart';
import 'my_book_tile_item_skeleton.dart';

class MyBookTile extends StatelessWidget {
  final List<Book>? books;
  final double width;
  final double height;
  final String title;
  final bool showPrice;
  final bool showRate;

  const MyBookTile({
    super.key,
    required this.books,
    this.width = 120,
    this.height = 160,
    required this.title,
    this.showPrice = false,
    this.showRate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        15.verticalSpace,

        //书籍信息
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              books?.length ?? 5,
              (index) {
                if (books == null) {
                  return MyBookTileItemSkeleton(
                    width: width,
                    height: height,
                  );
                }
                return MyBookTileItem(
                  book: books![index],
                  width: width,
                  height: height,
                  showPrice: showPrice,
                  showRate: showRate,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
