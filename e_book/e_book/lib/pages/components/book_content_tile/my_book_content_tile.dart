import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'my_book_content_tile_skeleton.dart';
import 'package:e_book/model/book.dart';

class MyBookContentTile extends StatelessWidget {
  final String? labelTitle;
  final Book? book;
  const MyBookContentTile({
    super.key,
    this.labelTitle,
    this.book,
  });

  @override
  Widget build(BuildContext context) {
    if (book == null || book?.description == null) {
      //骨架屏
      return const MyBookContentTileSkeleton();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '内容简介',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        ReadMoreText(
          book?.description ?? '',
          trimLines: 8,
          trimLength: 200,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          colorClickableText: Theme.of(context).colorScheme.primary,
          trimCollapsedText: '更多',
          trimExpandedText: '收起',
        ),

        10.verticalSpace,

        //更多信息
        Text(
          labelTitle ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        10.verticalSpace,

        Wrap(
          children: List.generate(
            book?.buyInfo?.length ?? 0,
            (index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: ActionChip(
                  label: Text(
                    "${book?.buyInfo?[index].name ?? ''} ${book?.buyInfo?[index].price ?? ''}",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  onPressed: () {},
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
