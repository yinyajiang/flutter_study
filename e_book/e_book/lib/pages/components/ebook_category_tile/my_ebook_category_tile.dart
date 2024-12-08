import 'package:e_book/model/ebook_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_ebook_category_tile_skeleton.dart';

class MyEbookCategoryTile extends StatelessWidget {
  final List<EBookCategory>? categories;
  final String? title;
  final Function(EBookCategory)? itemTap;

  const MyEbookCategoryTile({
    super.key,
    required this.categories,
    this.title,
    this.itemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        15.verticalSpace,
        SizedBox(
          width: double.infinity,
          child: Wrap(
            children: List.generate(
              categories?.length ?? 12,
              (index) {
                if (categories == null) {
                  return const MyEbookCategoryTileSkeleton();
                }
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: ActionChip(
                    padding: EdgeInsets.all(2.r),
                    label: Text(categories![index].name ?? ""),
                    onPressed: () =>
                        itemTap != null ? itemTap!(categories![index]) : null,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
