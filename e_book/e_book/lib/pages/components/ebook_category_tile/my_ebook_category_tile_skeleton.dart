import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyEbookCategoryTileSkeleton extends StatelessWidget {
  const MyEbookCategoryTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.inverseSurface,
      highlightColor: Theme.of(context).colorScheme.onInverseSurface,
      child: Padding(
        padding: EdgeInsets.only(right: 10.w, top: 5.h),
        child: Container(
          width: 80.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
