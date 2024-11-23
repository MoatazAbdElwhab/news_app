import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_sources/news_data_source.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();

  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.news != null) {
        newsList = response.news!;
      } else {
        errorMessage = 'Failed to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
