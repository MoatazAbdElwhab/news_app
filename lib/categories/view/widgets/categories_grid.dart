import 'package:flutter/material.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/view/widgets/category_item.dart';
import 'package:news_app/categories/data/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;
  const CategoriesGrid({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: appLocalizations.sports,
        imageName: 'sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'entertainment',
        name: appLocalizations.entertainment,
        imageName: 'politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: 'health',
        name: appLocalizations.health,
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'business',
        name: appLocalizations.business,
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'technology',
        name: appLocalizations.technology,
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: 'science',
        name: appLocalizations.science,
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
            appLocalizations.pickCategory,
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
                onTap: () {
                  onCategorySelected(categories[index]);
                  NewsViewModel.pageNumber = 1;
                },
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
