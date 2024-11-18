import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class TabItem extends StatelessWidget {
  final String sourceName;
  final bool isSelectedItem;
  const TabItem(
      {super.key, required this.sourceName, required this.isSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelectedItem ? AppTheme.primary : null,
        border: Border.all(width: 2, color: AppTheme.primary),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelectedItem ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
