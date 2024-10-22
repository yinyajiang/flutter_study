import 'package:flutter/material.dart';
import 'common/global.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Global.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Placeholder();
          }
          return const Placeholder();
        },
      ),
    );
  }
}
