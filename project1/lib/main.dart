import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TestRoute(),
    );
  }
}

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverFexibleHeader(
            visibleExtent: 200,
            builder: (context, maxExtent) => GestureDetector(
              child: Image(
                image: const AssetImage("assets/images/sea.png"),
                width: 50,
                height: maxExtent,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

typedef SliverFexibleHeaderBuilder = Widget Function(
    BuildContext context, double maxExtent);

class SliverFexibleHeader extends StatelessWidget {
  const SliverFexibleHeader({
    super.key,
    required this.builder,
    this.visibleExtent = 0.0,
  });

  final double visibleExtent;
  final SliverFexibleHeaderBuilder builder;

  @override
  Widget build(BuildContext context) {
    return _SliverFexibleHeader(
      visibleExtent: visibleExtent,
      child: LayoutBuilder(
        builder: (context, constraints) =>
            builder(context, constraints.maxHeight),
      ),
    );
  }
}

class _SliverFexibleHeader extends SingleChildRenderObjectWidget {
  const _SliverFexibleHeader({
    Key? key,
    required Widget? child,
    this.visibleExtent = 0.0,
  }) : super(key: key, child: child);
  final double visibleExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FlexibleHeaderRenderSliver(visibleExtent: visibleExtent);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant _FlexibleHeaderRenderSliver renderObject) {
    renderObject..visibleExtent = visibleExtent;
  }
}

class _FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  _FlexibleHeaderRenderSliver({
    required double visibleExtent,
  }) : _visibleExtent = visibleExtent;
  double _visibleExtent;

  @override
  set visibleExtent(double value) {
    if (_visibleExtent == value) {
      return;
    }
    _visibleExtent = value;
    markNeedsLayout();
  }

  @override
  double get visibleExtent => _visibleExtent;

  @override
  void performLayout() {
    if (child == null || constraints.scrollOffset >= visibleExtent) {
      geometry = SliverGeometry(scrollExtent: visibleExtent);
      return;
    }
    double overScroll =
        constraints.overlap < 0.0 ? constraints.overlap.abs() : 0.0;
    var paintExtent = visibleExtent + overScroll - constraints.scrollOffset;
    paintExtent = min(paintExtent, constraints.remainingPaintExtent);

    child!.layout(
      constraints.asBoxConstraints(maxExtent: paintExtent),
      parentUsesSize: true,
    );

    var layoutExtent = min(_visibleExtent, paintExtent);

    geometry = SliverGeometry(
      scrollExtent: visibleExtent,
      paintOrigin: -overScroll,
      paintExtent: paintExtent,
      maxPaintExtent: paintExtent,
      layoutExtent: layoutExtent,
    );
  }
}
