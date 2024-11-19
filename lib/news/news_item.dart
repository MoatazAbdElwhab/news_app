import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'BBC news',
            style:
                titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
          ),
          const SizedBox(height: 4),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeago.format(fifteenAgo),
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
