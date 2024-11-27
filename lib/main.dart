import 'package:flutter/material.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsViewModel(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
