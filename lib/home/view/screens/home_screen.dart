import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/news/view/screens/news_details_screen.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/view/widgets/categories_grid.dart';
import 'package:news_app/categories/view/widgets/category_details.dart';
import 'package:news_app/home/view/widgets/home_drawer.dart';
import 'package:news_app/categories/data/models/category_model.dart';
import 'package:news_app/settings/view/widgets/settings_tab.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: CustomSearch()),
              icon: const Icon(
                Icons.search,
                size: 28,
              ),
            ),
            SizedBox(width: 12),
          ],
          title: Text(
            selectedCategory != null
                ? selectedCategory!.name
                : selectedItem == DrawerItem.categories
                    ? appLocalizations.newsApp
                    : appLocalizations.settings,
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategoryId: selectedCategory!.id)
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

class CustomSearch extends SearchDelegate {
  final ScrollController _scrollController = ScrollController();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        hintColor: AppTheme.white,
        appBarTheme: const AppBarTheme(
          foregroundColor: AppTheme.white,
          backgroundColor: AppTheme.primary,
          toolbarTextStyle: TextStyle(
            color: AppTheme.white,
            fontSize: 18,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 24.0, color: AppTheme.white),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppTheme.white,
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          color: AppTheme.white,
          fontSize: 22,
        )));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('data');
  }

  Timer? _debounce;
  @override
  Widget buildSuggestions(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final newsViewModel = Provider.of<NewsViewModel>(context, listen: false);
    NewsViewModel.pageSearchNumber = 1;
    print(NewsViewModel.pageSearchNumber);
    if (query == '') {
      return Center(
        child: Text(appLocalizations.enterText),
      );
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();

      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (query.isNotEmpty) {
          newsViewModel.getSearchNews(query);
        }
      });
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   newsViewModel.getSearchNews(query);
      // });

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (!newsViewModel.isSearchLoading) {
            print('loadd');
            newsViewModel.getSearchNews(query, loadingPagination: true);
          }
        }
      });

      return Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (value.isSearchLoading) {
            return LoadingIndicator();
          } else if (value.errorMessage != null) {
            return Text(value.errorMessage!);
          } else {
            return value.newsSearchList.isEmpty
                ? const Center(
                    child: Text('Not found'),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: value.newsSearchList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                              news: newsViewModel.newsSearchList[index]),
                        )),
                        child: NewsItem(news: value.newsSearchList[index]),
                      );
                    },
                  );
          }
        },
      );
    }
  }
}
