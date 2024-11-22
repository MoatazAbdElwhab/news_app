import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/tabs/sources_tabs.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String selectedCategoryId;
  const CategoryDetails({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(selectedCategoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources;
          return SourcesTabs(
            sources: sources!,
          );
        }
      },
    );
  }
}
