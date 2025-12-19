import 'package:flutter/material.dart';
import '../../../core/models/news.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<News> newsList;
  final ValueChanged<News> onNewsTap;

  const NewsListView({
    super.key,
    required this.newsList,
    required this.onNewsTap,
  });

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return const Center(
        child: Text(
          'Список новостей пуст',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        return NewsTile(
          key: ValueKey(news.id),
          news: news,
          onTap: onNewsTap,
        );
      },
    );
  }
}