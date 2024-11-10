import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookTile extends StatelessWidget {
  static const ua =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';
  final List? books;
  final double width;
  final double height;
  final String title;

  const MyBookTile(
      {super.key,
      required this.books,
      this.width = 120,
      this.height = 160,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return //特别为您推荐
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        15.verticalSpace,

        //书籍信息
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              books?.length ?? 0,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          //封面
                          Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  books?[index]['image'] ?? '',
                                  headers: const {
                                    'User-Agent': ua,
                                  },
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //价格
                          Positioned(
                            bottom: height / 3,
                            child: Container(
                              width: 65.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(12.r)),
                              ),
                              child: Center(
                                child: Text(
                                  '￥19.80',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 标题
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        width: width,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          books?[index]['title'] ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      //副标题
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        width: width,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          books?[index]['authorName'] ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
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
