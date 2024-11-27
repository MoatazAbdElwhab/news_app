import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constants.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId, int page) async {
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
    return NewsResponse.fromJson(json);
  }

  Future<NewsResponse> getSearchNews(int page, String textSearch) async {
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
    return NewsResponse.fromJson(json);
  }
}
