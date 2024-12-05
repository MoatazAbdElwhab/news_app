import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository newsRepository;
  NewsViewModel() {
    newsRepository = NewsRepository(ServiceLocator.newsDataSource);
  }
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
      final news = await newsRepository.getNews(sourceId, pageNumber);

      pageNumber == 1 ? newsList = news : newsList.addAll(news);
      pageNumber++;
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
      final news =
          await newsRepository.getSearchNews(pageSearchNumber, textSearch);

      pageSearchNumber == 1
          ? newsSearchList = news
          : newsSearchList.addAll(news);
      pageSearchNumber++;
    } catch (error) {
      errorMessage = error.toString();
    }
    isSearchLoading = false;
    notifyListeners();
  }
}
