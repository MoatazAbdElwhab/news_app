import 'package:flutter/material.dart';
import 'package:news_app/news/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => NewsItem(),
      itemCount: 10,
    );
  }
}
