import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:e_book/model/book.dart';

class MyBookTileItem extends StatelessWidget {
  final Book book;
  final double width;
  final double height;
  final bool isShowPrice = false;
  const MyBookTileItem({
    super.key,
    required this.book,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Column(
        children: [
          Stack(
            children: [
              //封面
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      book.cover ?? '',
                      headers: const {
                        'User-Agent': ApiString.ua,
                      },
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //价格
              _getPriceUI(context, book),
            ],
          ),

          // 标题
          Container(
            padding: EdgeInsets.only(top: 10.h),
            width: width,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              book.title ?? '',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //副标题
          Container(
            padding: EdgeInsets.only(top: 10.h),
            width: width,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              book.authorName ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPriceUI(BuildContext context, Book? book) {
    if (!isShowPrice) {
      return const SizedBox();
    }
    return Positioned(
      bottom: height / 3,
      child: Container(
        width: 65.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(12.r)),
        ),
        child: Center(
          child: Text(
            isShowPrice ? book?.toString() ?? '' : '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
