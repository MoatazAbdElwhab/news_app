import 'package:flutter/material.dart';
import 'package:news_app/sources/view/widgets/sources_tabs.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:news_app/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final String selectedCategoryId;
  const CategoryDetails({super.key, required this.selectedCategoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.selectedCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(message: viewModel.errorMessage!);
          } else {
            return SourcesTabs(sources: viewModel.sources);
          }
        },
      ),
    );

    // FutureBuilder(
    //   future: ApiService.getSources(selectedCategoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return const ErrorIndicator();
    //     } else {
    //       final sources = snapshot.data?.sources;
    //       return SourcesTabs(
    //         sources: sources!,
    //       );
    //     }
    //   },
    // );
  }
}
