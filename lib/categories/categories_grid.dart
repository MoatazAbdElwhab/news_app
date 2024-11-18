import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: '1',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: '1',
        name: 'Politics',
        imageName: 'politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: '1',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: '1',
        name: 'Business',
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: '1',
        name: 'Enviroment',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: '1',
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
              ),
              itemBuilder: (context, index) => CategoryItem(
                category: categories[index],
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
