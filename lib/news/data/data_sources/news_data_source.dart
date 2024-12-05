import 'package:news_app/news/data/models/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId, int page);
  Future<List<News>> getSearchNews(int pageSearchNumber, String textSearch);
}
