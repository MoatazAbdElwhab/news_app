import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  final String selectedCategory;
  const CategoryDetails({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Category Details'),
    );
  }
}
