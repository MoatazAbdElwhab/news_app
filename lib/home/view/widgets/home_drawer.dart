import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/view/screens/home_screen.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;
  const HomeDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            color: AppTheme.primary,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: titleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 12, top: 12),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => onItemSelected(DrawerItem.categories),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 32,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Categories',
                            style: titleLargeStyle?.copyWith(
                                color: AppTheme.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => onItemSelected(DrawerItem.settings),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 32,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Settings',
                            style: titleLargeStyle?.copyWith(
                                color: AppTheme.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
