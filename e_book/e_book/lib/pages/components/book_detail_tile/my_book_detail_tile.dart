import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_book_detail_skeleton.dart';

class MyBookDetailTile extends StatelessWidget {
  final List<String> labels;
  final List<String>? data;
  const MyBookDetailTile({super.key, required this.labels, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (index) {
        if (data == null) {
          return MyBookDetailTileSkeleton(label: labels[index]);
        }
        return SizedBox(
          width: 100.w,
          child: Column(
            children: [
              Text(
                data![index],
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              3.verticalSpace,
              Text(
                labels[index],
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
