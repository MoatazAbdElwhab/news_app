import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/data/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;
  const CategoriesGrid({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        imageName: 'politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'technology',
        name: 'Technology',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: 'science',
        name: 'Science',
        imageName: 'science',
        color: AppTheme.yellow,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.lightBlack,
                ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () => onCategorySelected(categories[index]),
                child: CategoryItem(
                  category: categories[index],
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
