import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyAuthorTileSkeleton extends StatelessWidget {
  const MyAuthorTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.inverseSurface,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //作者信息
            Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    3.verticalSpace,
                    Container(
                      width: 60.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //了解作者
            Row(
              children: [
                Text(
                  '了解作者',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.r,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
