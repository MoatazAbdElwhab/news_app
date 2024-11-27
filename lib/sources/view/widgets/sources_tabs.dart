import 'package:flutter/material.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/news/view/widgets/news_list.dart';
import 'package:news_app/sources/view/widgets/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> sources;
  const SourcesTabs({super.key, required this.sources});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedTabIndex = index;
              NewsViewModel.pageNumber = 1;
              setState(() {});
            },
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabAlignment: TabAlignment.start,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    sourceName: source.name,
                    isSelectedItem:
                        widget.sources.indexOf(source) == selectedTabIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
            child: NewsList(
          sourceId: widget.sources[selectedTabIndex].id,
        )),
      ],
    );
  }
}
