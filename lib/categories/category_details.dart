import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  final String selectedCategory;
  const CategoryDetails({super.key, required this.selectedCategory});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: '$index', name: 'Source $index'),
  );
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(
      sources: sources,
    );
  }
}
