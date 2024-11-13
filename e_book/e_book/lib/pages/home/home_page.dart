import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:e_book/pages/components/my_book_tile.dart';
import 'package:e_book/pages/components/my_search_tile.dart';
import 'package:e_book/pages/home/home_vm.dart';
import 'package:e_book/pages/home/components/my_book_activites.dart';
import 'package:provider/provider.dart';
import 'package:e_book/model/activity.dart';
import 'package:e_book/pages/home/components/my_book_activity_labels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final HomeViewModel _viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.getHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _getBodyUI(),
    );
  }

  Widget _getBodyUI() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: SafeArea(
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
              Selector<HomeViewModel, List<Activity>?>(
                selector: (context, viewModel) => viewModel.activities,
                builder: (context, activities, child) {
                  if (activities == null) {
                    return const SizedBox();
                  }
                  return MyBookActivities(activities: activities);
                },
              ),
              15.verticalSpace,

              //活动类型
              Selector<HomeViewModel, List<String>?>(
                selector: (context, viewModel) => viewModel.activityLabels,
                builder: (context, activityLabels, child) {
                  if (activityLabels == null) {
                    return const SizedBox();
                  }
                  return MyBookActivityLabels(
                    activityLabels: activityLabels,
                    itemTap: (index) {},
                  );
                },
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
      ),
    );
  }
}
