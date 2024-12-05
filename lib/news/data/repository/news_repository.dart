import 'package:news_app/news/data/data_sources/news_api_data_source.dart';
import 'package:news_app/news/data/data_sources/news_data_source.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsRepository {
  final NewsDataSource newsDataSource;

  NewsRepository(this.newsDataSource);

  Future<List<News>> getNews(String sourceId, int page) async {
    return newsDataSource.getNews(sourceId, page);
  }

  Future<List<News>> getSearchNews(pageSearchNumber, textSearch) async {
    return newsDataSource.getSearchNews(pageSearchNumber, textSearch);
  }
}
