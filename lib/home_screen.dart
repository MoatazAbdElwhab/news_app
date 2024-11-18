import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_grid.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory != null
                ? selectedCategory!.name
                : selectedItem == DrawerItem.categories
                    ? 'News App'
                    : 'Settings',
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory: selectedCategory!.id)
            : selectedItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedItem = item;
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}

enum DrawerItem {
  categories,
  settings,
}
