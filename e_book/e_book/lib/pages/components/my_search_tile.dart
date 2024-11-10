import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class MySearchTile extends StatelessWidget {
  final VoidCallback? bookshelfTap;
  const MySearchTile({super.key, this.bookshelfTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //搜索框
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 40.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              '搜索...',
              style: TextStyle(
                fontSize: 15.sp,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
        //书架图标
        Container(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: bookshelfTap,
            icon: const Icon(LineIcons.stream),
            iconSize: 25.r,
          ),
        ),
      ],
    );
  }
}
