import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/pages/components/book_review_tile/my_book_review_item.dart';
import 'package:e_book/pages/components/book_review_tile/my_book_review_item_skeleton.dart';
import 'package:e_book/model/review.dart';

class MyBookReviewTile extends StatelessWidget {
  final List<Review>? reviews;
  const MyBookReviewTile({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '书评',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        15.verticalSpace,

        //评论列表
        Column(
          children: List.generate(reviews?.length ?? 4, (index) {
            if (reviews == null) {
              //骨架屏
              return const MyBookReviewItemSkeleton();
            }
            return MyBookReviewItem(review: reviews![index]);
          }),
        ),
      ],
    );
  }
}
