import 'package:e_book/pages/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'pages/theme/theme_provider.dart';
import 'pages/root/root_page.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  final logicalLongSide =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  const scaleFactor = 0.95;
  return Size(logicalShortSide * scaleFactor, logicalLongSide * scaleFactor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
          darkTheme: Provider.of<ThemeProvider>(context).darkTheme,
          home: const RootPage(),
        );
      },
    );
  }
}
