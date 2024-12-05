import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/data_sources/news_data_source.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constants.dart';

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId, int page) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'pageSize': '10',
        'page': page.toString(),
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      if (page == 1) {
        throw Exception('Failed to get news');
      }
      return [];
    }
  }

  @override
  Future<List<News>> getSearchNews(int page, String textSearch) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'pageSize': '10',
        'page': page.toString(),
        'q': textSearch,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      if (page == 1) {
        return throw Exception('Failed to get news');
      }
      return [];
    }
  }
}
