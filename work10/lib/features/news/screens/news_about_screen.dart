import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/news_about_store.dart';
import '../widgets/news_about_view.dart';

class NewsAboutScreen extends StatelessWidget {
  final NewsAboutStore store = NewsAboutStore();
  final int newsId;

  NewsAboutScreen({super.key, required this.newsId}) {
    store.loadNews(newsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Новость'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final news = store.news;
          if (news == null) {
            return Center(child: Text('Нет данных'));
          }
          return NewsAboutView(news: news);
        },
      ),
    );
  }
}