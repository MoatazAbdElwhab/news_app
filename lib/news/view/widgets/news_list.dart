import 'package:flutter/material.dart';
import 'package:news_app/news/view/screens/news_details_screen.dart';
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
  ScrollController scrollController = ScrollController();
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
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  viewModel.getNews(widget.sourceId, loadingPagination: true);
                }
                return true;
              },
              child: ListView.builder(
                itemBuilder: (_, index) => InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(
                              news: viewModel.newsList[index],
                            ))),
                    child: NewsItem(news: viewModel.newsList[index])),
                itemCount: viewModel.newsList.length,
              ),
            );
          }
        },
      ),
    );
  }
}
