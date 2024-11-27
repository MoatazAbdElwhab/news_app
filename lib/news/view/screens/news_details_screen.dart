import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News news;
  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(news.title!),
        ),
        body: Column(
          children: [
            NewsItem(news: news),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(news.description!),
                  InkWell(
                    onTap: () {
                      try {
                        callLaunchUrl(Uri.parse(news.url!));
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View Full Article',
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.arrow_circle_right,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> callLaunchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
