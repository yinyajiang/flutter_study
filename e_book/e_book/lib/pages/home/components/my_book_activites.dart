import 'package:e_book/http/spider/api_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:e_book/model/activity.dart';

class MyBookActivities extends StatelessWidget {
  MyBookActivities({super.key, required this.activities});

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '读书活动',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 150.h,
          child: Swiper(
            itemCount: activities.length,
            pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(
                color: Colors.white.withOpacity(0.4),
                activeColor: Colors.white,
                size: 8.0,
                activeSize: 10.0,
                space: 2.0,
              ),
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  //背景图
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          activities[index].cover ?? '',
                          headers: const {
                            'User-Agent': ApiString.ua,
                          },
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //背景遮罩
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),

                  //文字
                  Container(
                    height: 150.h,
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //标题
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          activities[index].title ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //专题、时间
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                activities[index].label ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            Text(
                              activities[index].time ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  15.verticalSpace,

                  //活动类型
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
