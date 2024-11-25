import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book/http/spider/api_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_book/model/book.dart';

class MyBookDetailAppBar extends StatefulWidget {
  final Book book;
  final Widget? topActions;
  const MyBookDetailAppBar({super.key, required this.book, this.topActions});

  @override
  State<MyBookDetailAppBar> createState() => _MyBookDetailAppBarState();
}

class _MyBookDetailAppBarState extends State<MyBookDetailAppBar> {
  final _coverKey = GlobalKey();
  double _coverWidth = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final coverRenderObject =
          _coverKey.currentContext?.findRenderObject() as RenderBox;
      if (_coverWidth != coverRenderObject.size.width) {
        _coverWidth = coverRenderObject.size.width;
        setState(() {});
      }
    });

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Stack(
        children: [
          //背景
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.book.cover ?? "",
                  headers: const {
                    "User-Agent": ApiString.ua,
                  },
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //遮罩
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
          ),

          //前景
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                //模糊背景
                BlurryContainer(
                  borderRadius: BorderRadius.zero,
                  child: Container(),
                ),

                Padding(
                  //安全区域高度
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //leading actions
                      widget.topActions ?? const SizedBox(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            bottom: 15.h,
                          ),
                          child: Stack(
                            children: [
                              //封面
                              AspectRatio(
                                aspectRatio: 3 / 4,
                                child: Container(
                                  key: _coverKey,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        widget.book.cover ?? "",
                                        headers: const {
                                          "User-Agent": ApiString.ua,
                                        },
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //标题
                              Container(
                                margin: EdgeInsets.only(
                                  left: _coverWidth,
                                ),
                                child: _getTitleUI(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //封面

                      //标题

                      //副标题
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTitleUI() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.book.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          6.verticalSpace,
          Text(
            widget.book.subtitle ?? widget.book.authorName ?? "",
            maxLines: 2,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
