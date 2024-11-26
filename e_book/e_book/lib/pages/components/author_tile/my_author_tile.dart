import 'package:e_book/http/spider/api_string.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_author_tile_skeleton.dart';

class MyAuthorTile extends StatelessWidget {
  final List<String>? authors;
  const MyAuthorTile({super.key, this.authors});

  @override
  Widget build(BuildContext context) {
    if (authors == null) {
      //骨架屏
      return MyAuthorTileSkeleton();
    }
    return Column(
      children: List.generate(authors?.length ?? 0, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //作者信息
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://via.placeholder.com/150',
                      height: 40.r,
                      width: 40.r,
                      fit: BoxFit.cover,
                      httpHeaders: const {
                        "User-Agent": ApiString.ua,
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authors![index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '作者',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).colorScheme.inversePrimary,
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
        );
      }),
    );
  }
}
