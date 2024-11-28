import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e_book/model/review.dart';

class MyBookReviewItem extends StatelessWidget {
  final Review review;
  const MyBookReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //读者
          Row(
            children: [
              //头像
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: review.author?.avatar ?? "",
                  width: 40.r,
                  height: 40.r,
                  fit: BoxFit.cover,
                  httpHeaders: const {
                    'User-Agent': ApiString.ua,
                  },
                ),
              ),
              10.horizontalSpace,
              //名称，评分
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.author?.name ?? "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RatingBar.builder(
                    itemCount: 5,
                    ignoreGestures: true,
                    initialRating: (review.rate ?? 0.0) / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemPadding: EdgeInsets.only(right: 2.w),
                    itemSize: 15.r,
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
            ],
          ),
          10.verticalSpace,

          //评论
          Text(
            review.short ?? "",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
