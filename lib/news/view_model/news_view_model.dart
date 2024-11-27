import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_sources/news_data_source.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();

  List<News> newsList = [];
  List<News> newsSearchList = [];
  bool isLoading = false;
  bool isSearchLoading = false;
  String? errorMessage;
  static int pageNumber = 1;
  static int pageSearchNumber = 1;

  Future<void> getNews(String sourceId,
      {bool loadingPagination = false}) async {
    if (!loadingPagination) {
      isLoading = true;
      notifyListeners();
    }

    try {
      final response = await dataSource.getNews(sourceId, pageNumber);
      if (response.status == 'ok' && response.news != null) {
        pageNumber == 1
            ? newsList = response.news!
            : newsList.addAll(response.news!);
        pageNumber++;
      } else {
        if (newsList.isEmpty) {
          errorMessage = 'Failed to get news';
        }
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSearchNews(
    String textSearch, {
    bool loadingPagination = false,
  }) async {
    if (!loadingPagination) {
      isSearchLoading = true;
      notifyListeners();
    }
    try {
      final response =
          await dataSource.getSearchNews(pageSearchNumber, textSearch);
      if (response.status == 'ok' && response.news != null) {
        pageSearchNumber == 1
            ? newsSearchList = response.news!
            : newsSearchList.addAll(response.news!);
        pageSearchNumber++;
      } else {
        if (newsSearchList.isEmpty) {
          errorMessage = 'Failed to get news';
        }
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isSearchLoading = false;
    notifyListeners();
  }
}
