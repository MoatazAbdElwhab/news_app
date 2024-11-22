import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final news = snapshot.data?.news;
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(
              news: news![index],
            ),
            itemCount: news?.length,
          );
        }
      },
    );
  }
}
