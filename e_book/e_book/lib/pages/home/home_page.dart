import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://img2.doubanio.com/mpic/book-activity-748da42df3e742b78987298b908ee4e1",
    "https://img1.doubanio.com/mpic/book-activity-ec299fc693314bebb84129acbc02f928",
    "https://img9.doubanio.com/view/subject/m/public/s34888575.jpg",
    "https://img2.doubanio.com/mpic/book-activity-941912fa0c9143aab7d429f555fe05c1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _getBodyUI(),
    );
  }

  Widget _getBodyUI() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            10.verticalSpace,

            //头像
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '晚上好， swcode',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                ),
              ],
            ),
            15.verticalSpace,

            //搜索
            Row(
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
                    onPressed: () {},
                    icon: const Icon(LineIcons.stream),
                    iconSize: 25.r,
                  ),
                ),
              ],
            ),
            15.verticalSpace,

            //读书活动
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '读书活动',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
