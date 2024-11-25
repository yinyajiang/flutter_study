import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class MyBookContentTile extends StatelessWidget {
  final String? content;
  final String? labelTitle;
  final List<String>? labels;
  const MyBookContentTile({
    super.key,
    this.content,
    this.labelTitle,
    this.labels,
  });

  @override
  Widget build(BuildContext context) {
    if (content == null) {
      //骨架屏
      return const SizedBox();
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
          content ?? '',
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
            labels?.length ?? 0,
            (index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: ActionChip(
                  label: Text(labels?[index] ?? '',
                      style: TextStyle(fontSize: 12.sp)),
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
