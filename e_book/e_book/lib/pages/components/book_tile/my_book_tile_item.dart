import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:e_book/model/book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyBookTileItem extends StatelessWidget {
  final Book book;
  final double width;
  final double height;
  final bool showPrice;
  final bool showRate;

  const MyBookTileItem({
    super.key,
    required this.book,
    required this.width,
    required this.height,
    this.showPrice = false,
    this.showRate = false,
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
          _getSubtitleUI(context, book),

          //评分
          _getRateUI(context, book),
        ],
      ),
    );
  }

  Widget _getSubtitleUI(BuildContext context, Book? book) {
    if (book == null || (book.subtitle == null && book.authorName == null)) {
      return const SizedBox();
    }

    return Container(
      padding: EdgeInsets.only(top: 10.h),
      width: width,
      child: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        book.subtitle ?? book.authorName ?? '',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }

  Widget _getRateUI(BuildContext context, Book? book) {
    if (!showRate) {
      return const SizedBox();
    }
    return Container(
      margin: EdgeInsets.only(top: 6.h),
      width: width,
      child: Row(
        children: [
          RatingBar.builder(
            itemCount: 5,
            itemSize: 15.r,
            ignoreGestures: true,
            initialRating: (book?.rate ?? 0) / 2,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemPadding: EdgeInsets.only(right: 2.w),
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.tertiary,
              );
            },
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }

  Widget _getPriceUI(BuildContext context, Book? book) {
    if (!showPrice) {
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
            showPrice ? book?.toString() ?? '' : '',
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
