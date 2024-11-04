import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'pages/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
