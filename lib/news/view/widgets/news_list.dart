import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(
              message: viewModel.errorMessage!,
            );
          } else {
            return ListView.builder(
              itemBuilder: (_, index) =>
                  NewsItem(news: viewModel.newsList[index]),
              itemCount: viewModel.newsList.length,
            );
          }
        },
      ),
    );

    // FutureBuilder(
    //   future: ApiService.getNews(sourceId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return ErrorIndicator(
    //         message: '',
    //       );
    //     } else {
    //       final news = snapshot.data?.news;
    //       return ListView.builder(
    //         itemBuilder: (_, index) => NewsItem(
    //           news: news![index],
    //         ),
    //         itemCount: news?.length,
    //       );
    //     }
    //   },
    // );
  }
}
