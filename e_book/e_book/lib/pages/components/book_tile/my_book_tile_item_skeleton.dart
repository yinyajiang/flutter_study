import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyBookTileItemSkeleton extends StatelessWidget {
  final double width;
  final double height;
  const MyBookTileItemSkeleton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.inverseSurface,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //封面
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ],
            ),

            10.verticalSpace,
            // 标题
            Container(
              padding: EdgeInsets.only(top: 10.h),
              height: 20.h, //必须给高度
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            5.verticalSpace,
            //副标题
            Container(
              padding: EdgeInsets.only(top: 5.h),
              height: 18.h, //必须给高度
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
