import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:e_book/pages/components/my_book_tile.dart';
import 'package:e_book/pages/components/my_search_tile.dart';
import 'package:e_book/pages/home/home_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 0;
  List<String> activities = [
    "全部",
    "读书专题",
    "直播活动",
    "名家问答",
    "共读活动",
    "鉴书团",
  ];

  List<Map<String, dynamic>> books = [
    {
      "title": "小城与不确定性的墙",
      "authorName": "村上春树",
      "image": "https://img9.doubanio.com/view/subject/s/public/s34975756.jpg",
    },
    {
      "title": "恶女的告白",
      "authorName": "叶真中显",
      "image": "https://img9.doubanio.com/view/subject/s/public/s34917944.jpg",
    },
    {
      "title": "女人的胜利",
      "authorName": "余华",
      "image": "https://img1.doubanio.com/view/subject/s/public/s34953668.jpg",
    },
    {
      "title": "怪画谜案",
      "authorName": "雨穴",
      "image": "https://img1.doubanio.com/view/subject/s/public/s34903230.jpg",
    },
  ];

  List<String> images = [
    "https://img2.doubanio.com/mpic/book-activity-748da42df3e742b78987298b908ee4e1",
    "https://img1.doubanio.com/mpic/book-activity-ec299fc693314bebb84129acbc02f928",
    "https://img9.doubanio.com/view/subject/m/public/s34888575.jpg",
    "https://img2.doubanio.com/mpic/book-activity-941912fa0c9143aab7d429f555fe05c1",
  ];

  final HomeViewModel _viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.getActivities();
  }

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

            MySearchTile(
              bookshelfTap: () {},
            ),
            //搜索
            30.verticalSpace,

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
                10.verticalSpace,
                SizedBox(
                  height: 150.h,
                  child: Swiper(
                    itemCount: images.length,
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
                                  images[index],
                                  headers: const {
                                    'User-Agent': MyBookTile.ua,
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
                                  "词语的深处｜第三届豆瓣读书诗歌节",
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
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Text(
                                        '直播活动',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      '2024-11-10 14:00',
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
            ),
            15.verticalSpace,

            //活动类型
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "活动类型",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  5.verticalSpace,
                  Wrap(
                    children: List.generate(
                      activities.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: ChoiceChip(
                            label: Text(activities[index]),
                            selected: _value == index,
                            onSelected: (value) {
                              setState(() {
                                _value = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            30.verticalSpace,

            MyBookTile(
              books: books,
              title: "特别为您推荐",
              width: 120.w,
              height: 160.h,
            ),
          ],
        ),
      ),
    );
  }
}
